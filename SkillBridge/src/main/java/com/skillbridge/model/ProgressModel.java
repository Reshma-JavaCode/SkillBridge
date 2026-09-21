package com.skillbridge.model;

public class ProgressModel {

	private int progressId;
	private int userid;
	private int skillId;
	private int questionsAttempted;
	private int questionsCorrect;
	
	private String skillName;
	
	public ProgressModel()
	{
		
	}
	public ProgressModel(int userid, int skillId, int questionsAttempted, int questionsCorrect) {
		super();
		//this.progressId = progressId;
		this.userid = userid;
		this.skillId = skillId;
		this.questionsAttempted = questionsAttempted;
		this.questionsCorrect = questionsCorrect;
	}
	public int getProgressId() {
		return progressId;
	}
	public void setProgressId(int progressId) {
		this.progressId = progressId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getSkillId() {
		return skillId;
	}
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	public int getQuestionsAttempted() {
		return questionsAttempted;
	}
	public void setQuestionsAttempted(int questionsAttempted) {
		this.questionsAttempted = questionsAttempted;
	}
	public int getQuestionsCorrect() {
		return questionsCorrect;
	}
	public void setQuestionsCorrect(int questionsCorrect) {
		this.questionsCorrect = questionsCorrect;
	}
	
	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	@Override
	public String toString() {
		return "ProgressModel [progressId=" + progressId + ", userid=" + userid + ", skillId=" + skillId
				+ ", questionsAttempted=" + questionsAttempted + ", questionsCorrect=" + questionsCorrect + "]";
	}
	
	
}
