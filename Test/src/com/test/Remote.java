package com.test;

public class Remote {
	/**
	 * ������Ϣ
	 * 
	 * @param msg
	 *            ���յ���Ϣ
	 * @param callBack
	 *            �ص�����������
	 */
	public void executeMessage(String msg, CallBack callBack) {
		/** ģ��Զ�������ڴ����������飬������Ҫ�������ʱ�� **/
		for (int i = 0; i < 1000000000; i++) {
			System.out.println("------" + i);
		}
		/** �������������飬������������Ϣ **/
		System.out.println(msg);
		System.out.println("I hava executed the message by Local");
		/** ִ�лص� **/
		callBack.execute(new String[] { "Nice to meet you~!" });
	}
}
