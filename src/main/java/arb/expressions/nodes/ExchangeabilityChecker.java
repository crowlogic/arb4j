package arb.expressions.nodes;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import arb.expressions.nodes.binary.AdditionNode;
import arb.expressions.nodes.binary.BinaryOperationNode;
import arb.expressions.nodes.binary.DivisionNode;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.binary.SubtractionNode;
import arb.expressions.nodes.nary.NAryOperationNode;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;

/**
 * Static utility class that determines whether two nested accumulation operators
 * (integrals, sums, or mixed) in the AST are structurally exchangeable per
 * Fubini's theorem.
 *
 * <p>An outer operator A and an inner operator B are structurally exchangeable
 * when:</p>
 * <ol>
 *   <li>B is a descendant of A on a single root-to-leaf path</li>
 *   <li>Every intermediate node on that path is a linear operator (addition,
 *       subtraction, negation, or multiplication/division by a factor
 *       independent of both bound variables)</li>
 *   <li>The inner operator's bounds do not depend on the outer operator's
 *       bound variable (constant-limits case)</li>
 * </ol>
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExchangeabilityChecker
{

  /**
   * Determines whether two nested accumulation operators are structurally
   * exchangeable in the AST.
   *
   * @param outer the outer operator node (IntegralNode or NAryOperationNode)
   * @param inner the inner operator node (IntegralNode or NAryOperationNode)
   * @return true if the path from outer to inner is linear and bounds are
   *         independent
   */
  public static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isStructurallyExchangeable(Node<D, C, F> outer, Node<D, C, F> inner)
  {
    assert isAccumulationOperator(outer) : "outer is not an accumulation operator: " + outer.getClass();
    assert isAccumulationOperator(inner) : "inner is not an accumulation operator: " + inner.getClass();

    // 1. Collect the path from outer's operand root to inner
    List<Node<D, C, F>> path = findPathToDescendant(outer, inner);
    if (path == null)
    {
      return false;
    }

    // 2. Check linearity of every intermediate node on the path
    VariableNode<D, C, F> outerVar = getBoundVariable(outer);
    VariableNode<D, C, F> innerVar = getBoundVariable(inner);
    for (Node<D, C, F> node : path)
    {
      if (node == outer || node == inner)
      {
        continue;
      }
      if (!isLinearOperator(node, outerVar, innerVar))
      {
        return false;
      }
    }

    // 3. Check bounds independence
    return areBoundsIndependent(outer, inner);
  }

  /**
   * Returns the bound (integration/summation) variable for an accumulation
   * operator node.
   *
   * @param node an IntegralNode or NAryOperationNode
   * @return the bound variable node
   */
  @SuppressWarnings("unchecked")
  public static <D, C, F extends Function<? extends D, ? extends C>>
         VariableNode<D, C, F>
         getBoundVariable(Node<D, C, F> node)
  {
    if (node instanceof IntegralNode<D, C, F> integral)
    {
      return integral.integrationVariableNode;
    }
    if (node instanceof NAryOperationNode<D, C, F> nary)
    {
      return (VariableNode<D, C, F>) nary.expression.newVariableNode(nary.indexVariableFieldName);
    }
    throw new IllegalArgumentException("not an accumulation operator: " + node.getClass());
  }

  /**
   * Returns true if the node is an accumulation operator (IntegralNode or
   * NAryOperationNode).
   */
  public static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isAccumulationOperator(Node<D, C, F> node)
  {
    return node instanceof IntegralNode || node instanceof NAryOperationNode;
  }

  /**
   * Finds the direct child of an accumulation operator that contains its operand
   * body (the integrand for IntegralNode, the operand expression root for
   * NAryOperationNode).
   */
  @SuppressWarnings("unchecked")
  static <D, C, F extends Function<? extends D, ? extends C>>
         Node<D, C, F>
         getOperandRoot(Node<D, C, F> node)
  {
    if (node instanceof IntegralNode<D, C, F> integral)
    {
      return integral.integrandNode;
    }
    if (node instanceof NAryOperationNode<D, C, F> nary)
    {
      return (Node<D, C, F>) nary.operandExpression.rootNode;
    }
    throw new IllegalArgumentException("not an accumulation operator: " + node.getClass());
  }

  /**
   * Finds the path from an outer accumulation operator's operand root to an
   * inner node, collecting every node on the path. Returns null if inner is not
   * reachable from outer's operand on a single branch.
   *
   * <p>The returned list includes outer and inner as the first and last
   * elements.</p>
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         List<Node<D, C, F>>
         findPathToDescendant(Node<D, C, F> outer, Node<D, C, F> inner)
  {
    Node<D, C, F>       operandRoot = getOperandRoot(outer);
    List<Node<D, C, F>> path        = new ArrayList<>();
    path.add(outer);
    if (operandRoot == inner)
    {
      path.add(inner);
      return path;
    }
    if (findPathDFS(operandRoot, inner, path))
    {
      return path;
    }
    return null;
  }

  /**
   * Recursive DFS that builds the path from current to target. Returns true if
   * target is found as a descendant of current. Uses getBranches() to enumerate
   * children generically.
   */
  private static <D, C, F extends Function<? extends D, ? extends C>>
          boolean
          findPathDFS(Node<D, C, F> current, Node<D, C, F> target, List<Node<D, C, F>> path)
  {
    path.add(current);
    if (current == target)
    {
      return true;
    }

    // For BinaryOperationNode, check left and right
    if (current instanceof BinaryOperationNode<D, C, F> binop)
    {
      if (binop.left != null && containsNode(binop.left, target))
      {
        return findPathDFS(binop.left, target, path);
      }
      if (binop.right != null && containsNode(binop.right, target))
      {
        return findPathDFS(binop.right, target, path);
      }
    }
    // For UnaryOperationNode / FunctionNode (NegationNode, etc.)
    else if (current instanceof arb.expressions.nodes.unary.FunctionNode<D, C, F> func)
    {
      if (func.arg != null && containsNode(func.arg, target))
      {
        return findPathDFS(func.arg, target, path);
      }
    }
    // For IntegralNode (nested inner integral)
    else if (current instanceof IntegralNode<D, C, F> integral)
    {
      if (containsNode(integral.integrandNode, target))
      {
        return findPathDFS(integral.integrandNode, target, path);
      }
    }

    path.remove(path.size() - 1);
    return false;
  }

  /**
   * Returns true if target is found anywhere in the subtree rooted at root
   * (identity check, not equality).
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         containsNode(Node<D, C, F> root, Node<D, C, F> target)
  {
    if (root == target)
    {
      return true;
    }
    boolean[] found = { false };
    root.accept(new Consumer<Node<D, C, F>>()
    {
      @Override
      public void accept(Node<D, C, F> node)
      {
        if (node == target)
        {
          found[0] = true;
        }
      }
    });
    return found[0];
  }

  /**
   * Checks whether a node on the path between outer and inner is a linear
   * operator with respect to both bound variables. Linear operators are those
   * that preserve the validity of exchanging integration/summation order:
   * addition, subtraction, negation, and multiplication/division where one
   * operand is independent of both bound variables.
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isLinearOperator(Node<D, C, F> node,
                          VariableNode<D, C, F> outerVar,
                          VariableNode<D, C, F> innerVar)
  {
    if (node instanceof AdditionNode || node instanceof SubtractionNode)
    {
      return true;
    }
    if (node instanceof NegationNode)
    {
      return true;
    }
    if (node instanceof MultiplicationNode<D, C, F> mul)
    {
      // Linear if one operand is independent of both variables
      boolean leftIndep  = !mul.left.dependsOn(outerVar) && !mul.left.dependsOn(innerVar);
      boolean rightIndep = !mul.right.dependsOn(outerVar) && !mul.right.dependsOn(innerVar);
      return leftIndep || rightIndep;
    }
    if (node instanceof DivisionNode<D, C, F> div)
    {
      // Linear only if divisor is independent of both variables
      return !div.right.dependsOn(outerVar) && !div.right.dependsOn(innerVar);
    }
    // All other operators (exponentiation, function application, etc.) are
    // non-linear
    return false;
  }

  /**
   * Checks that the inner operator's bounds do not depend on the outer
   * operator's bound variable (constant-limits case). When bounds are dependent,
   * exchanging requires limit transformation (not yet implemented).
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         areBoundsIndependent(Node<D, C, F> outer, Node<D, C, F> inner)
  {
    VariableNode<D, C, F> outerVar = getBoundVariable(outer);

    // Check inner's bounds don't depend on outer's variable
    if (inner instanceof IntegralNode<D, C, F> integral)
    {
      if (integral.lowerLimitNode != null && integral.lowerLimitNode.dependsOn(outerVar))
      {
        return false;
      }
      if (integral.upperLimitNode != null && integral.upperLimitNode.dependsOn(outerVar))
      {
        return false;
      }
    }
    else if (inner instanceof NAryOperationNode<D, C, F> nary)
    {
      if (nary.lowerLimit.dependsOn(outerVar))
      {
        return false;
      }
      if (nary.upperLimit.dependsOn(outerVar))
      {
        return false;
      }
    }

    // Also check outer's bounds don't depend on inner's variable
    VariableNode<D, C, F> innerVar = getBoundVariable(inner);
    if (outer instanceof IntegralNode<D, C, F> integral)
    {
      if (integral.lowerLimitNode != null && integral.lowerLimitNode.dependsOn(innerVar))
      {
        return false;
      }
      if (integral.upperLimitNode != null && integral.upperLimitNode.dependsOn(innerVar))
      {
        return false;
      }
    }
    else if (outer instanceof NAryOperationNode<D, C, F> nary)
    {
      if (nary.lowerLimit.dependsOn(innerVar))
      {
        return false;
      }
      if (nary.upperLimit.dependsOn(innerVar))
      {
        return false;
      }
    }

    return true;
  }

  /**
   * Searches the operand subtree of an accumulation operator for the first
   * nested accumulation operator that is structurally exchangeable with it.
   *
   * @param outer the outer accumulation operator
   * @return the first exchangeable inner operator, or null if none found
   */
  public static <D, C, F extends Function<? extends D, ? extends C>>
         Node<D, C, F>
         findExchangeableInnerOperator(Node<D, C, F> outer)
  {
    Node<D, C, F> operandRoot = getOperandRoot(outer);
    Node<D, C, F>[] result = new Node[1];
    operandRoot.accept(new Consumer<Node<D, C, F>>()
    {
      @Override
      public void accept(Node<D, C, F> node)
      {
        if (result[0] != null)
        {
          return;
        }
        if (node != outer && isAccumulationOperator(node))
        {
          if (isStructurallyExchangeable(outer, node))
          {
            result[0] = node;
          }
        }
      }
    });
    return result[0];
  }
}
