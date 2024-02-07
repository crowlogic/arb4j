package arb.expressions.executionflow;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import org.objectweb.asm.util.Textifier;
import org.objectweb.asm.util.TraceMethodVisitor;

import arb.expressions.executionflow.nodes.AbstractInsnNode;
import arb.expressions.executionflow.nodes.BasicValue;
import arb.expressions.executionflow.nodes.IincInsnNode;
import arb.expressions.executionflow.nodes.InsnList;
import arb.expressions.executionflow.nodes.JumpInsnNode;
import arb.expressions.executionflow.nodes.LabelNode;
import arb.expressions.executionflow.nodes.LookupSwitchInsnNode;
import arb.expressions.executionflow.nodes.MethodNode;
import arb.expressions.executionflow.nodes.TableSwitchInsnNode;
import arb.expressions.executionflow.nodes.TryCatchBlockNode;
import arb.expressions.executionflow.nodes.Value;
import arb.expressions.executionflow.nodes.VarInsnNode;

public class Analyzer<V extends Value> implements
                     Opcodes
{

  /**
   * Computes and returns the maximum number of local variables used in the given
   * method.
   *
   * @param method a method.
   * @return the maximum number of local variables used in the given method.
   */
  private static int computeMaxLocals(final MethodNode method)
  {
    int maxLocals = Type.getArgumentsAndReturnSizes(method.desc) >> 2;
    if ((method.access & Opcodes.ACC_STATIC) != 0)
    {
      maxLocals -= 1;
    }
    for (AbstractInsnNode insnNode : method.instructions)
    {
      if (insnNode instanceof VarInsnNode)
      {
        int local = ((VarInsnNode) insnNode).var;
        int size  = (insnNode.getOpcode() == Opcodes.LLOAD || insnNode.getOpcode() == Opcodes.DLOAD
                      || insnNode.getOpcode() == Opcodes.LSTORE || insnNode.getOpcode() == Opcodes.DSTORE) ? 2 : 1;
        maxLocals = Math.max(maxLocals, local + size);
      }
      else if (insnNode instanceof IincInsnNode)
      {
        int local = ((IincInsnNode) insnNode).var;
        maxLocals = Math.max(maxLocals, local + 1);
      }
    }
    return maxLocals;
  }

  /**
   * Computes and returns the maximum stack size of a method, given its stack map
   * frames.
   *
   * @param frames the stack map frames of a method.
   * @return the maximum stack size of the given method.
   */
  private static int computeMaxStack(final Frame<?>[] frames)
  {
    int maxStack = 0;
    for (Frame<?> frame : frames)
    {
      if (frame != null)
      {
        int stackSize = 0;
        for (int i = 0; i < frame.getStackSize(); ++i)
        {
          stackSize += frame.getStack(i).getSize();
        }
        maxStack = Math.max(maxStack, stackSize);
      }
    }
    return maxStack;
  }

  private static String getUnqualifiedName(final String name)
  {
    int lastSlashIndex = name.lastIndexOf('/');
    if (lastSlashIndex == -1)
    {
      return name;
    }
    else
    {
      int endIndex = name.length();
      if (name.charAt(endIndex - 1) == ';')
      {
        endIndex--;
      }
      int lastBracketIndex = name.lastIndexOf('[');
      if (lastBracketIndex == -1)
      {
        return name.substring(lastSlashIndex + 1, endIndex);
      }
      return name.substring(0, lastBracketIndex + 1) + name.substring(lastSlashIndex + 1, endIndex);
    }
  }

  public static void
         printResult(final MethodNode method, final Analyzer<BasicValue> analyzer, final PrintWriter printWriter)
  {
    Textifier          textifier          = new Textifier();
    TraceMethodVisitor traceMethodVisitor = new TraceMethodVisitor(textifier);

    printWriter.println(method.name + method.desc);
    for (int i = 0; i < method.instructions.size(); ++i)
    {
      method.instructions.get(i).accept(traceMethodVisitor);

      StringBuilder     stringBuilder = new StringBuilder();
      Frame<BasicValue> frame         = analyzer.getFrames()[i];
      if (frame == null)
      {
        stringBuilder.append('?');
      }
      else
      {
        for (int j = 0; j < frame.getLocals(); ++j)
        {
          stringBuilder.append(getUnqualifiedName(frame.getLocal(j).toString())).append(' ');
        }
        stringBuilder.append(" : ");
        for (int j = 0; j < frame.getStackSize(); ++j)
        {
          stringBuilder.append(getUnqualifiedName(frame.getStack(j).toString())).append(' ');
        }
      }
      while (stringBuilder.length() < method.maxStack + method.maxLocals + 1)
      {
        stringBuilder.append(' ');
      }
      printWriter.print(Integer.toString(i + 100000).substring(1));
      printWriter.print(" " + stringBuilder + " : " + textifier.text.get(textifier.text.size() - 1));
    }
    for (TryCatchBlockNode tryCatchBlock : method.tryCatchBlocks)
    {
      tryCatchBlock.accept(traceMethodVisitor);
      printWriter.print(" " + textifier.text.get(textifier.text.size() - 1));
    }
    printWriter.println();
  }

  /**
   * The execution stack frames of the currently analyzed method (one per
   * instruction index).
   */
  private Frame<V>[]                frames;

  /**
   * The exception handlers of the currently analyzed method (one list per
   * instruction index).
   */
  private List<TryCatchBlockNode>[] handlers;

  /**
   * The instructions that remain to process (one boolean per instruction index).
   */
  private boolean[]                 inInstructionsToProcess;

  /** The instructions of the currently analyzed method. */
  private InsnList                  insnList;

  /** The size of {@link #insnList}. */
  private int                       insnListSize;

  /**
   * The indices of the instructions that remain to process in the currently
   * analyzed method.
   */
  private int[]                     instructionsToProcess;

  /**
   * The interpreter to use to symbolically interpret the bytecode instructions.
   */
  private final Interpreter<V>      interpreter;

  /**
   * The number of instructions that remain to process in the currently analyzed
   * method.
   */
  private int                       numInstructionsToProcess;

  /**
   * The subroutines of the currently analyzed method (one per instruction index).
   */
  private Subroutine[]              subroutines;

//  /**
//   * Constructs a new {@link Analyzer}.
//   *
//   * @param interpreter the interpreter to use to symbolically interpret the
//   *                    bytecode instructions.
//   */
//  public Analyzer(final Interpreter<V> interpreter)
//  {
//    this.interpreter = interpreter;
//  }

  public Analyzer(Interpreter<V> verifier)
  {
    this.interpreter = verifier;
  }

  /**
   * Analyzes the given method.
   *
   * @param owner  the internal name of the class to which 'method' belongs (see
   *               {@link Type#getInternalName()}).
   * @param method the method to be analyzed. The maxStack and maxLocals fields
   *               must have correct values.
   * @return the symbolic state of the execution stack frame at each bytecode
   *         instruction of the method. The size of the returned array is equal to
   *         the number of instructions (and labels) of the method. A given frame
   *         is {@literal null} if and only if the corresponding instruction
   *         cannot be reached (dead code).
   * @throws AnalyzerException if a problem occurs during the analysis.
   */
  @SuppressWarnings("unchecked")
  public Frame<V>[] analyze(final String owner, final MethodNode method)
  {
    assert method != null;
    assert owner != null;
    if ((method.access & (ACC_ABSTRACT | ACC_NATIVE)) != 0)
    {
      frames = (Frame<V>[]) new Frame<?>[0];
      return frames;
    }
    insnList                 = method.instructions;
    insnListSize             = insnList.size();
    handlers                 = (List<TryCatchBlockNode>[]) new List<?>[insnListSize];
    frames                   = (Frame<V>[]) new Frame<?>[insnListSize];
    subroutines              = new Subroutine[insnListSize];
    inInstructionsToProcess  = new boolean[insnListSize];
    instructionsToProcess    = new int[insnListSize];
    numInstructionsToProcess = 0;

    // For each exception handler, and each instruction within its range, record in
    // 'handlers' the
    // fact that execution can flow from this instruction to the exception handler.
    for (int i = 0; i < method.tryCatchBlocks.size(); ++i)
    {
      TryCatchBlockNode tryCatchBlock = method.tryCatchBlocks.get(i);
      int               startIndex    = insnList.indexOf(tryCatchBlock.start);
      int               endIndex      = insnList.indexOf(tryCatchBlock.end);
      for (int j = startIndex; j <= endIndex; ++j)
      {
        List<TryCatchBlockNode> insnHandlers = handlers[j];
        if (insnHandlers == null)
        {
          insnHandlers = new ArrayList<>();
          handlers[j]  = insnHandlers;
        }
        insnHandlers.add(tryCatchBlock);
      }
    }

    // Finds the method's subroutines.
    findSubroutines(method.maxLocals);

    // Initializes the data structures for the control flow analysis.
    Frame<V> currentFrame;

    currentFrame = computeInitialFrame(owner, method);
    mergeFrameAndSubroutine(0, currentFrame, null);
    init(owner, method);

    // Control flow analysis.
    while (numInstructionsToProcess > 0)
    {
      // Get and remove one instruction from the list of instructions to process.
      int        insnIndex  = instructionsToProcess[--numInstructionsToProcess];
      Frame<V>   oldFrame   = frames[insnIndex];
      Subroutine subroutine = subroutines[insnIndex];
      inInstructionsToProcess[insnIndex] = false;

      // Simulate the execution of this instruction.
      AbstractInsnNode insnNode   = method.instructions.get(insnIndex);
      int              insnOpcode = insnNode.getOpcode();
      int              insnType   = insnNode.getType();

      if (insnType == AbstractInsnNode.LABEL || insnType == AbstractInsnNode.LINE
                    || insnType == AbstractInsnNode.FRAME)
      {
        analyzeLabelLineNumberOrFrame(insnIndex, oldFrame, subroutine);
      }
      else
      {
        currentFrame.init(oldFrame).execute(insnNode, interpreter);
        subroutine = subroutine == null ? null : new Subroutine(subroutine);

        if (insnNode instanceof JumpInsnNode)
        {
          analyzeJumpInstruction(method, currentFrame, insnIndex, subroutine, insnNode, insnOpcode);
        }
        else if (insnNode instanceof TableSwitchInsnNode)
        {
          analyzeLookupSwitchInstruction(currentFrame, insnIndex, subroutine, insnNode, insnOpcode);
        }
        else if (insnNode instanceof TableSwitchInsnNode)
        {
          analyzeTableSwitchInstruction(currentFrame, insnIndex, subroutine, insnNode, insnOpcode);
        }
        else if (insnOpcode == RET)
        {
          analyzeReturnFromSubroutine(currentFrame, insnIndex, subroutine, insnNode);
        }
        else if (insnOpcode != ATHROW && (insnOpcode < IRETURN || insnOpcode > RETURN))
        {
          analyzeReturnFromSubroutine(currentFrame, insnIndex, subroutine, insnNode, insnOpcode);
        }
      }

      List<TryCatchBlockNode> insnHandlers = handlers[insnIndex];
      if (insnHandlers != null)
      {
        analyzeTryCatchBlock(insnIndex, oldFrame, subroutine, insnHandlers);
      }
    }

    return frames;
  }

  /**
   * Analyzes the given method and computes and sets its maximum stack size and
   * maximum number of local variables.
   *
   * @param owner  the internal name of the class to which 'method' belongs (see
   *               {@link Type#getInternalName()}).
   * @param method the method to be analyzed.
   * @return the symbolic state of the execution stack frame at each bytecode
   *         instruction of the method. The size of the returned array is equal to
   *         the number of instructions (and labels) of the method. A given frame
   *         is {@literal null} if and only if the corresponding instruction
   *         cannot be reached (dead code).
   * @throws AnalyzerException if a problem occurs during the analysis.
   */
  public Frame<V>[] analyzeAndComputeMaxs(final String owner, final MethodNode method)
  {
    method.maxLocals = computeMaxLocals(method);
    method.maxStack  = -1;
    analyze(owner, method);
    method.maxStack = computeMaxStack(frames);
    return frames;
  }

  private void analyzeJumpInstruction(final MethodNode method,
                                      Frame<V> currentFrame,
                                      int insnIndex,
                                      Subroutine subroutine,
                                      AbstractInsnNode insnNode,
                                      int insnOpcode)
  {
    JumpInsnNode jumpInsn = (JumpInsnNode) insnNode;
    if (insnOpcode != GOTO && insnOpcode != JSR)
    {
      currentFrame.initJumpTarget(insnOpcode, /* target = */ null);
      analyzeLabelLineNumberOrFrame(insnIndex, currentFrame, subroutine);
    }
    int jumpInsnIndex = insnList.indexOf(jumpInsn.label);
    currentFrame.initJumpTarget(insnOpcode, jumpInsn.label);
    if (insnOpcode == JSR)
    {
      mergeFrameAndSubroutine(jumpInsnIndex,
                              currentFrame,
                              new Subroutine(jumpInsn.label,
                                             method.maxLocals,
                                             jumpInsn));
    }
    else
    {
      mergeFrameAndSubroutine(jumpInsnIndex, currentFrame, subroutine);
    }
    newControlFlowEdge(insnIndex, jumpInsnIndex);
  }

  private void analyzeLabelLineNumberOrFrame(int insnIndex, Frame<V> oldFrame, Subroutine subroutine)
  {
    mergeFrameAndSubroutine(insnIndex + 1, oldFrame, subroutine);
    newControlFlowEdge(insnIndex, insnIndex + 1);
  }

  private void analyzeLookupSwitchInstruction(Frame<V> currentFrame,
                                              int insnIndex,
                                              Subroutine subroutine,
                                              AbstractInsnNode insnNode,
                                              int insnOpcode)
  {
    LookupSwitchInsnNode lookupSwitchInsn = (LookupSwitchInsnNode) insnNode;
    int                  targetInsnIndex  = insnList.indexOf(lookupSwitchInsn.dflt);
    currentFrame.initJumpTarget(insnOpcode, lookupSwitchInsn.dflt);
    mergeFrameAndSubroutine(targetInsnIndex, currentFrame, subroutine);
    newControlFlowEdge(insnIndex, targetInsnIndex);
    for (int i = 0; i < lookupSwitchInsn.labels.size(); ++i)
    {
      LabelNode label = lookupSwitchInsn.labels.get(i);
      targetInsnIndex = insnList.indexOf(label);
      currentFrame.initJumpTarget(insnOpcode, label);
      mergeFrameAndSubroutine(targetInsnIndex, currentFrame, subroutine);
      newControlFlowEdge(insnIndex, targetInsnIndex);
    }
  }

  private void analyzeReturnFromSubroutine(Frame<V> currentFrame,
                                           int insnIndex,
                                           Subroutine subroutine,
                                           AbstractInsnNode insnNode)
  {
    if (subroutine == null)
    {
      throw new RuntimeException(insnNode + ": " + "RET instruction outside of a subroutine");
    }
    for (int i = 0; i < subroutine.callers.size(); ++i)
    {
      JumpInsnNode caller       = subroutine.callers.get(i);
      int          jsrInsnIndex = insnList.indexOf(caller);
      if (frames[jsrInsnIndex] != null)
      {
        mergeFrameAndSubroutineForRETInstruction(jsrInsnIndex
                      + 1, frames[jsrInsnIndex], currentFrame, subroutines[jsrInsnIndex], subroutine.localsUsed);
        newControlFlowEdge(insnIndex, jsrInsnIndex + 1);
      }
    }
  }

  private void analyzeReturnFromSubroutine(Frame<V> currentFrame,
                                           int insnIndex,
                                           Subroutine subroutine,
                                           AbstractInsnNode insnNode,
                                           int insnOpcode)
  {
    if (subroutine != null)
    {
      if (insnNode instanceof VarInsnNode)
      {
        int varIndex = ((VarInsnNode) insnNode).var;
        subroutine.localsUsed[varIndex] = true;
        if (insnOpcode == LLOAD || insnOpcode == DLOAD || insnOpcode == LSTORE || insnOpcode == DSTORE)
        {
          subroutine.localsUsed[varIndex + 1] = true;
        }
      }
      else if (insnNode instanceof IincInsnNode)
      {
        int varIndex = ((IincInsnNode) insnNode).var;
        subroutine.localsUsed[varIndex] = true;
      }
    }
    analyzeLabelLineNumberOrFrame(insnIndex, currentFrame, subroutine);
  }

  private void analyzeTableSwitchInstruction(Frame<V> currentFrame,
                                             int insnIndex,
                                             Subroutine subroutine,
                                             AbstractInsnNode insnNode,
                                             int insnOpcode)
  {
    TableSwitchInsnNode tableSwitchInsn = (TableSwitchInsnNode) insnNode;
    int                 targetInsnIndex = insnList.indexOf(tableSwitchInsn.dflt);
    currentFrame.initJumpTarget(insnOpcode, tableSwitchInsn.dflt);
    mergeFrameAndSubroutine(targetInsnIndex, currentFrame, subroutine);
    newControlFlowEdge(insnIndex, targetInsnIndex);
    for (int i = 0; i < tableSwitchInsn.labels.size(); ++i)
    {
      LabelNode label = tableSwitchInsn.labels.get(i);
      currentFrame.initJumpTarget(insnOpcode, label);
      targetInsnIndex = insnList.indexOf(label);
      mergeFrameAndSubroutine(targetInsnIndex, currentFrame, subroutine);
      newControlFlowEdge(insnIndex, targetInsnIndex);
    }
  }

  private void analyzeTryCatchBlock(int insnIndex,
                                    Frame<V> oldFrame,
                                    Subroutine subroutine,
                                    List<TryCatchBlockNode> insnHandlers)
  {
    for (TryCatchBlockNode tryCatchBlock : insnHandlers)
    {
      Type catchType;
      if (tryCatchBlock.type == null)
      {
        catchType = Type.getObjectType("java/lang/Throwable");
      }
      else
      {
        catchType = Type.getObjectType(tryCatchBlock.type);
      }
      if (newControlFlowExceptionEdge(insnIndex, tryCatchBlock))
      {
        Frame<V> handler = newFrame(oldFrame);
        handler.clearStack();
        handler.push(interpreter.newExceptionValue(tryCatchBlock, handler, catchType));
        mergeFrameAndSubroutine(insnList.indexOf(tryCatchBlock.handler), handler, subroutine);
      }
    }
  }

  /**
   * Computes the initial execution stack frame of the given method.
   *
   * @param owner  the internal name of the class to which 'method' belongs (see
   *               {@link Type#getInternalName()}).
   * @param method the method to be analyzed.
   * @return the initial execution stack frame of the 'method'.
   */
  private Frame<V> computeInitialFrame(final String owner, final MethodNode method)
  {
    Frame<V> frame            = newFrame(method.maxLocals, method.maxStack);
    int      currentLocal     = 0;
    boolean  isInstanceMethod = (method.access & ACC_STATIC) == 0;
    if (isInstanceMethod)
    {
      Type ownerType = Type.getObjectType(owner);
      frame.setLocal(currentLocal, interpreter.newParameterValue(isInstanceMethod, currentLocal, ownerType));
      currentLocal++;
    }
    Type[] argumentTypes = Type.getArgumentTypes(method.desc);
    for (Type argumentType : argumentTypes)
    {
      frame.setLocal(currentLocal, interpreter.newParameterValue(isInstanceMethod, currentLocal, argumentType));
      currentLocal++;
      if (argumentType.getSize() == 2)
      {
        frame.setLocal(currentLocal, interpreter.newEmptyValue(currentLocal));
        currentLocal++;
      }
    }
    while (currentLocal < method.maxLocals)
    {
      frame.setLocal(currentLocal, interpreter.newEmptyValue(currentLocal));
      currentLocal++;
    }
    frame.setReturn(interpreter.newReturnTypeValue(Type.getReturnType(method.desc)));
    return frame;
  }

  /**
   * Follows the control flow graph of the currently analyzed method, starting at
   * the given instruction index, and stores a copy of the given subroutine in
   * {@link #subroutines} for each encountered instruction. Jumps to nested
   * subroutines are <i>not</i> followed: instead, the corresponding instructions
   * are put in the given list.
   *
   * @param insnIndex  an instruction index.
   * @param subroutine a subroutine.
   * @param jsrInsns   where the jsr instructions for nested subroutines must be
   *                   put.
   * @throws AnalyzerException if the control flow graph can fall off the end of
   *                           the code.
   */
  private void
          findSubroutine(final int insnIndex, final Subroutine subroutine, final List<AbstractInsnNode> jsrInsns)
  {
    ArrayList<Integer> instructionIndicesToProcess = new ArrayList<>();
    instructionIndicesToProcess.add(insnIndex);
    while (!instructionIndicesToProcess.isEmpty())
    {
      int currentInsnIndex = instructionIndicesToProcess.remove(instructionIndicesToProcess.size() - 1);
      if (currentInsnIndex < 0 || currentInsnIndex >= insnListSize)
      {
        throw new RuntimeException("Execution can fall off the end of the code");
      }
      if (subroutines[currentInsnIndex] != null)
      {
        continue;
      }
      subroutines[currentInsnIndex] = new Subroutine(subroutine);
      AbstractInsnNode currentInsn = insnList.get(currentInsnIndex);

      // Push the normal successors of currentInsn onto instructionIndicesToProcess.
      if (currentInsn instanceof JumpInsnNode)
      {
        if (currentInsn.getOpcode() == JSR)
        {
          // Do not follow a jsr, it leads to another subroutine!
          jsrInsns.add(currentInsn);
        }
        else
        {
          JumpInsnNode jumpInsn = (JumpInsnNode) currentInsn;
          instructionIndicesToProcess.add(insnList.indexOf(jumpInsn.label));
        }
      }
      else if (currentInsn instanceof TableSwitchInsnNode)
      {
        TableSwitchInsnNode tableSwitchInsn = (TableSwitchInsnNode) currentInsn;
        findSubroutine(insnList.indexOf(tableSwitchInsn.dflt), subroutine, jsrInsns);
        for (int i = tableSwitchInsn.labels.size() - 1; i >= 0; --i)
        {
          LabelNode labelNode = tableSwitchInsn.labels.get(i);
          instructionIndicesToProcess.add(insnList.indexOf(labelNode));
        }
      }
      else if (currentInsn instanceof LookupSwitchInsnNode)
      {
        LookupSwitchInsnNode lookupSwitchInsn = (LookupSwitchInsnNode) currentInsn;
        findSubroutine(insnList.indexOf(lookupSwitchInsn.dflt), subroutine, jsrInsns);
        for (int i = lookupSwitchInsn.labels.size() - 1; i >= 0; --i)
        {
          LabelNode labelNode = lookupSwitchInsn.labels.get(i);
          instructionIndicesToProcess.add(insnList.indexOf(labelNode));
        }
      }

      // Push the exception handler successors of currentInsn onto
      // instructionIndicesToProcess.
      List<TryCatchBlockNode> insnHandlers = handlers[currentInsnIndex];
      if (insnHandlers != null)
      {
        for (TryCatchBlockNode tryCatchBlock : insnHandlers)
        {
          instructionIndicesToProcess.add(insnList.indexOf(tryCatchBlock.handler));
        }
      }

      // Push the next instruction, if the control flow can go from currentInsn to the
      // next.
      switch (currentInsn.getOpcode())
      {
      case GOTO:
      case RET:
      case TABLESWITCH:
      case LOOKUPSWITCH:
      case IRETURN:
      case LRETURN:
      case FRETURN:
      case DRETURN:
      case ARETURN:
      case RETURN:
      case ATHROW:
        break;
      default:
        instructionIndicesToProcess.add(currentInsnIndex + 1);
        break;
      }
    }
  }

  /**
   * Finds the subroutines of the currently analyzed method and stores them in
   * {@link #subroutines}.
   *
   * @param maxLocals the maximum number of local variables of the currently
   *                  analyzed method (long and double values count for two
   *                  variables).
   * @throws AnalyzerException if the control flow graph can fall off the end of
   *                           the code.
   */
  private void findSubroutines(final int maxLocals)
  {
    // For each instruction, compute the subroutine to which it belongs.
    // Follow the main 'subroutine', and collect the jsr instructions to nested
    // subroutines.
    Subroutine             main     = new Subroutine(null,
                                                     maxLocals,
                                                     null);
    List<AbstractInsnNode> jsrInsns = new ArrayList<>();
    findSubroutine(0, main, jsrInsns);
    // Follow the nested subroutines, and collect their own nested subroutines,
    // until all
    // subroutines are found.
    Map<LabelNode, Subroutine> jsrSubroutines = new HashMap<>();
    while (!jsrInsns.isEmpty())
    {
      JumpInsnNode jsrInsn    = (JumpInsnNode) jsrInsns.remove(0);
      Subroutine   subroutine = jsrSubroutines.get(jsrInsn.label);
      if (subroutine == null)
      {
        subroutine = new Subroutine(jsrInsn.label,
                                    maxLocals,
                                    jsrInsn);
        jsrSubroutines.put(jsrInsn.label, subroutine);
        findSubroutine(insnList.indexOf(jsrInsn.label), subroutine, jsrInsns);
      }
      else
      {
        subroutine.callers.add(jsrInsn);
      }
    }
    // Clear the main 'subroutine', which is not a real subroutine (and was used
    // only as an
    // intermediate step above to find the real ones).
    for (int i = 0; i < insnListSize; ++i)
    {
      if (subroutines[i] != null && subroutines[i].start == null)
      {
        subroutines[i] = null;
      }
    }
  }

  /**
   * Returns the symbolic execution stack frame for each instruction of the last
   * analyzed method.
   *
   * @return the symbolic state of the execution stack frame at each bytecode
   *         instruction of the method. The size of the returned array is equal to
   *         the number of instructions (and labels) of the method. A given frame
   *         is {@literal null} if the corresponding instruction cannot be
   *         reached, or if an error occurred during the analysis of the method.
   */
  public Frame<V>[] getFrames()
  {
    return frames;
  }

  /**
   * Returns the exception handlers for the given instruction.
   *
   * @param insnIndex the index of an instruction of the last analyzed method.
   * @return a list of {@link TryCatchBlockNode} objects.
   */
  public List<TryCatchBlockNode> getHandlers(final int insnIndex)
  {
    return handlers[insnIndex];
  }

  /**
   * Initializes this analyzer. This method is called just before the execution of
   * control flow analysis loop in {@link #analyze}. The default implementation of
   * this method does nothing.
   *
   * @param owner  the internal name of the class to which the method belongs (see
   *               {@link Type#getInternalName()}).
   * @param method the method to be analyzed.
   * @throws AnalyzerException if a problem occurs.
   */
  protected void init(final String owner, final MethodNode method)
  {
    // Nothing to do.
  }

  /**
   * Merges the given frame and subroutine into the frame and subroutines at the
   * given instruction index. If the frame or the subroutine at the given
   * instruction index changes as a result of this merge, the instruction index is
   * added to the list of instructions to process (if it is not already the case).
   *
   * @param insnIndex  an instruction index.
   * @param frame      a frame. This frame is left unchanged by this method.
   * @param subroutine a subroutine. This subroutine is left unchanged by this
   *                   method.
   * @throws AnalyzerException if the frames have incompatible sizes.
   */
  private boolean mergeFrameAndSubroutine(final int insnIndex, final Frame<V> frame, final Subroutine subroutine)
  {
    boolean  changed;
    Frame<V> oldFrame = frames[insnIndex];
    if (oldFrame == null)
    {
      frames[insnIndex] = newFrame(frame);
      changed           = true;
    }
    else
    {
      changed = oldFrame.merge(frame, interpreter);
    }
    Subroutine oldSubroutine = subroutines[insnIndex];
    if (oldSubroutine == null)
    {
      if (subroutine != null)
      {
        subroutines[insnIndex] = new Subroutine(subroutine);
        changed                = true;
      }
    }
    else
    {
      if (subroutine != null)
      {
        changed |= oldSubroutine.merge(subroutine);
      }
    }
    if (changed && !inInstructionsToProcess[insnIndex])
    {
      inInstructionsToProcess[insnIndex]                = true;
      instructionsToProcess[numInstructionsToProcess++] = insnIndex;
    }
    return changed;
  }

  /**
   * Merges the given frame and subroutine into the frame and subroutines at the
   * given instruction index (case of a RET instruction). If the frame or the
   * subroutine at the given instruction index changes as a result of this merge,
   * the instruction index is added to the list of instructions to process (if it
   * is not already the case).
   *
   * @param insnIndex           the index of an instruction immediately following
   *                            a jsr instruction.
   * @param frameBeforeJsr      the execution stack frame before the jsr
   *                            instruction. This frame is merged into
   *                            'frameAfterRet'.
   * @param frameAfterRet       the execution stack frame after a ret instruction
   *                            of the subroutine. This frame is merged into the
   *                            frame at 'insnIndex' (after it has itself been
   *                            merge with 'frameBeforeJsr').
   * @param subroutineBeforeJsr if the jsr is itself part of a subroutine (case of
   *                            nested subroutine), the subroutine it belongs to.
   * @param localsUsed          the local variables read or written in the
   *                            subroutine.
   * @throws AnalyzerException if the frames have incompatible sizes.
   */
  private void mergeFrameAndSubroutineForRETInstruction(final int insnIndex,
                                                        final Frame<V> frameBeforeJsr,
                                                        final Frame<V> frameAfterRet,
                                                        final Subroutine subroutineBeforeJsr,
                                                        final boolean[] localsUsed)
  {
    frameAfterRet.merge(frameBeforeJsr, localsUsed);

    boolean  changed;
    Frame<V> oldFrame = frames[insnIndex];
    if (oldFrame == null)
    {
      frames[insnIndex] = newFrame(frameAfterRet);
      changed           = true;
    }
    else
    {
      changed = oldFrame.merge(frameAfterRet, interpreter);
    }
    Subroutine oldSubroutine = subroutines[insnIndex];
    if (oldSubroutine != null && subroutineBeforeJsr != null)
    {
      changed |= oldSubroutine.merge(subroutineBeforeJsr);
    }
    if (changed && !inInstructionsToProcess[insnIndex])
    {
      inInstructionsToProcess[insnIndex]                = true;
      instructionsToProcess[numInstructionsToProcess++] = insnIndex;
    }
  }

  // -----------------------------------------------------------------------------------------------

  /**
   * Creates a control flow graph edge. The default implementation of this method
   * does nothing. It can be overridden in order to construct the control flow
   * graph of a method (this method is called by the {@link #analyze} method
   * during its visit of the method's code).
   *
   * @param insnIndex      an instruction index.
   * @param successorIndex index of a successor instruction.
   */
  protected void newControlFlowEdge(final int insnIndex, final int successorIndex)
  {
    // Nothing to do.
  }

  /**
   * Creates a control flow graph edge corresponding to an exception handler. The
   * default implementation of this method does nothing. It can be overridden in
   * order to construct the control flow graph of a method (this method is called
   * by the {@link #analyze} method during its visit of the method's code).
   *
   * @param insnIndex      an instruction index.
   * @param successorIndex index of a successor instruction.
   * @return true if this edge must be considered in the data flow analysis
   *         performed by this analyzer, or false otherwise. The default
   *         implementation of this method always returns true.
   */
  protected boolean newControlFlowExceptionEdge(final int insnIndex, final int successorIndex)
  {
    return true;
  }

  /**
   * Creates a control flow graph edge corresponding to an exception handler. The
   * default implementation of this method delegates to
   * {@link #newControlFlowExceptionEdge(int, int)}. It can be overridden in order
   * to construct the control flow graph of a method (this method is called by the
   * {@link #analyze} method during its visit of the method's code).
   *
   * @param insnIndex     an instruction index.
   * @param tryCatchBlock TryCatchBlockNode corresponding to this edge.
   * @return true if this edge must be considered in the data flow analysis
   *         performed by this analyzer, or false otherwise. The default
   *         implementation of this method delegates to
   *         {@link #newControlFlowExceptionEdge(int, int)}.
   */
  protected boolean newControlFlowExceptionEdge(final int insnIndex, final TryCatchBlockNode tryCatchBlock)
  {
    return newControlFlowExceptionEdge(insnIndex, insnList.indexOf(tryCatchBlock.handler));
  }

  /**
   * Constructs a copy of the given frame.
   *
   * @param frame a frame.
   * @return the created frame.
   */
  protected Frame<V> newFrame(final Frame<? extends V> frame)
  {
    return new Frame<>(frame);
  }

  /**
   * Constructs a new frame with the given size.
   *
   * @param numLocals the maximum number of local variables of the frame.
   * @param numStack  the maximum stack size of the frame.
   * @return the created frame.
   */
  protected Frame<V> newFrame(final int numLocals, final int numStack)
  {
    return new Frame<>(numLocals,
                       numStack);
  }
}