package com.lj.mst.data

class TestData {
	long xh;
	long xh1;
    static constraints = {
		xh(min:0l,widget:"textarea");
    }
	static mapping={
		sort(xh:"desc")
		//sort(xh1:"desc")
	}
	public static String xh_label="序号";
}
