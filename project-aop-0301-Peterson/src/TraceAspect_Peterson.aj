
public aspect TraceAspect_Peterson {
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace():  classToTrace() && execution(* *(..));//execution(* *App.getName(..));
	
	before(): methodToTrace() {
		      System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " +
		            thisJoinPointStaticPart.getSourceLocation().getLine());
		   }

	after(): methodToTrace() {
		      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
		   }
}
