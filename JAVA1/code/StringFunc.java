

public class StringFunc{
    final static String s="扁担长，板凳宽，板凳没有扁担长，扁担没有板凳宽。扁担要绑在板凳上,板凳偏不让扁担绑在板凳上。";
    public static void main(String args[]){

    	String s1=s.substring(0,3);
    	System.out.println(s1);

		for(int i=0;i<s.length();i++){
			i = s.indexOf("扁担",i);
			if(i<0)break;
			System.out.print(i+" ");
		}
		System.out.println();
		long time= System.currentTimeMillis();
		String s2= new String();
		s2="";
		for(int i=0;i<10000;i++){
            s2+=s;
        }
        System.out.println("字符串相加的时间： "+(System.currentTimeMillis()-time)+"ms  字符串长度："+s2.length());

		time= System.currentTimeMillis();
		StringBuilder stringBuilder = new StringBuilder();
        for(int i=0;i<10000;i++){
            stringBuilder.append(s);
        }
        System.out.println("StringBuilder的时间： "+(System.currentTimeMillis()-time)+"ms  字符串长度："+stringBuilder.toString().length());
    }
}