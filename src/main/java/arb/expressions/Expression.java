package arb.expressions;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.*;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.*;

import java.io.File;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.*;
import java.util.stream.*;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.context.Dependency;
import arb.expressions.nodes.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.nary.*;
import arb.expressions.nodes.unary.*;
import arb.functions.*;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.*;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;
import arb.utensils.text.trees.TextTree;
import arb.utensils.text.trees.TreeModel;