package com.test;

public class Local implements CallBack, Runnable {

	/**
	 * Զ�̽�����Ϣ���࣬ģ��point-to-point
	 */
	private Remote remote;

	/**
	 * ���ͳ�ȥ����Ϣ
	 */
	private String message;
ASDFASD
	public Local(Remote remote, String message) {
		super();
		this.remote = remote;
		this.message = message;
	}

	/**
	 * ������Ϣ
	 */
	public void sendMessage() {
		/** ��ǰ�̵߳����� **/
		System.out.println(Thread.currentThread().getName());
		/** ����һ���µ��̷߳�����Ϣ **/
		Thread thread = new Thread(this);
		thread.start();
		/** ��ǰ�̼߳���ִ�� **/
		System.out.println("Message has been sent by Local~!");
	}

	/**
	 * ������Ϣ��Ļص�����
	 */
	public void execute(Object... objects) {
		/** ��ӡ���ص���Ϣ **/
		System.out.println(objects[0]);
		/** ��ӡ������Ϣ���߳����� **/
		System.out.println(Thread.currentThread().getName());
		/** �жϷ�����Ϣ���߳� **/
		Thread.interrupted();
	}

	public static void main(String[] args) {
		Local local = new Local(new Remote(), "Hello");

		local.sendMessage();
	}

	public void run() {
		remote.executeMessage(message, this);

	}

}
