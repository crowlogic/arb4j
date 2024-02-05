package arb.expressions.decompiler;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;

/**
 * 
 * TOOD: make something that will produce something like this 
 * 
 * <pre>
Execution Flow Analysis of '∏k{k=OnePointPointThree}.class'

We perform a line-by-line analysis of the bytecode for the evaluate method, 
focusing on understanding the stack behavior and context of this vs. super 
access as interpreted by the decompiler.

Initial State 
•  Stack: [] (empty)
•  Local Variable Table 
Start Length Slot Signature
0     67     1    Void
0     67     2    int
0     67     3    int
0     67     4    Real

Execution Flow 
1.0: aload_0
•.Stack: [this]
•.Loads a reference to the current object (this) onto the stack.
2.1: getfield #13
•.Stack: [ℝ1]
•.Fetches the field ℝ1 of the current object, replacing this with the ℝ1 value.
3.4: aload_0
•.Stack: [ℝ1, this]
•.Loads another reference to this onto the stack.
4.5: getfield #14
•.Stack: [ℝ1, ℝ1]
•.Accesses another instance of ℝ1, which might be causing confusion but technically refers to the same ℝ1 field in the context of this.
5.8: invokevirtual #20
•.Stack: []
•.Invokes the one() method on ℝ1, which is expected to return an arb.Real and is immediately popped from the stack (due to the pop instruction at 11), resulting in an empty stack.
6.12: aload_0
•.Stack: [this]
•.Loads this onto the stack again for the next field access.
7.13: getfield #24
•.Stack: [k]
•.Gets the k field from the current object.
8.16: aload_0
•.Stack: [k, this]
•.Loads this again for accessing another field.
9.17: getfield #27
•.Stack: [k, startIndex]
•.Fetches startIndex field value.
10.20: invokevirtual #33
•.Stack: []
•.Calls set(Larb/Integer;)Larb/Integer; on k, passing startIndex as an argument, and pops the result, leaving the stack empty.
11.24: goto 52
•.State Transition: Jumps to the instruction at index 52, controlling the flow for the loop. This step does not directly affect the stack but is crucial for understanding the loop's logic.
12.27-51: Loop Body
•.The instructions within this range are repeated based on the loop's logic, affecting and being affected by the stack contents similarly to the described steps, involving method calls on ℝ1 and manipulations of k.
13.52: aload_0 (Loop condition start)
•.Stack: [this]
•.Prepares for field access within the loop condition check.
14.53: getfield #24
•.Stack: [k]
•.Accesses the k field for comparison.
15.56: aload_0
•.Stack: [k, this]
•.Loads this for the next field access.
16.57: getfield #46
•.Stack: [k, endIndex]
•.Fetches endIndex for comparison.
17.60: invokevirtual #50
•.Stack: [comparisonResult]
•.Compares k to endIndex, leaving the comparison result on the stack.
18.63: ifle 27
•.Stack: []
•.Conditional jump based on comparisonResult; if k ≤ endIndex, loop continues, otherwise exits. This step affects the control flow, not directly altering the stack content aside from
 removing the comparison result.
19.66: areturn
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class ExecutionFlowHelper
{

}
