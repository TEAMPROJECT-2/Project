package com.itwillbs.mail;

import java.util.Random;

public class TempKey{
	private boolean lowerCheck;
	private int size;

	// 인증코드 부르기
	public String getKey(int size, boolean lowerCheck) {
		this.size = size;
		this.lowerCheck = lowerCheck;
		return init();
	}

	// 인증코드 난수화
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num  = 0;
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
}