package com.skillbridge.model;

public class SkillModel {

    private int skillId;
    private String skillName;
    private String description;

    public SkillModel() {
    }

    public SkillModel(int skillId, String skillName, String description) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.description = description;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	@Override
	public String toString() {
		return "SkillModel [skillId=" + skillId + ", skillName=" + skillName + ", description=" + description + "]";
	}
    
    
}