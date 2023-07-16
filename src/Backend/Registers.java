package Backend;

import IR.Value.Value;

import java.util.ArrayList;
import java.util.Arrays;

public class Registers {
	public static final ArrayList<Registers> SREGS = new ArrayList<>();
	public static final ArrayList<Registers> TREGS = new ArrayList<>();
	static  {
		ArrayList<String> names = new ArrayList<>(Arrays.asList( "t0", "t1", "t2",  "t3", "t4", "t5", "t6"));
		ArrayList<String> names1 = new ArrayList<>(Arrays.asList(  "s0", "s1",  "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11"));
		for (int i = 0; i < 7; i++) {
			TREGS.add(new Registers(i, names.get(i)));
		}
		for (int i = 0; i < 12; i++) {
			SREGS.add(new Registers(i, names1.get(i)));
		}
	}
	public static Registers getReg(String s,int i)
	{
		if(s.charAt(0)=='t')
		{
			return TREGS.get(i);
		}
		if(s.charAt(0)=='s')
		{
			return SREGS.get(i);
		}
		return null;
	}
//	public static Registers AllocateT()
//	{
//		for(Registers i : TREGS)
//		{
//			if(i.value==null) {
//				i.isAvailable=Boolean.FALSE;
//				return i;
//			}
//		}return null;
//	}
//	public static Registers AllocateS()
//	{
//		for(Registers i : SREGS)
//		{
//			if(i.value==null) {
//				i.isAvailable=Boolean.FALSE;
//				return i;
//			}
//		}return null;
//	}
//	public static Boolean hasAvailableT()
//	{
//		for(Registers i : TREGS)
//		{
//			if(i.value==null) {
//				return Boolean.TRUE;
//			}
//		}return Boolean.FALSE;
//	}
//	public static Boolean hasAvailableS()
//	{
//		for(Registers i : SREGS)
//		{
//			if(i.value==null) {
//				return Boolean.TRUE;
//			}
//		}return Boolean.FALSE;
//	}
	private int index;
	private String name;
	private Value value=null;
	private Boolean isAvailable=Boolean.TRUE;
	public Registers(int index, String name) {
		this.index = index;
		this.name = name;
	}

	@Override
	public String toString() {
		return "$"+name;
	}

	public void setValue(Value value) {
		this.value = value;
	}
	public void setFree()
	{
		this.value=null;
	}
}