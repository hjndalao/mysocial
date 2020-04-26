package com.social.pojo;

public class RegistrationOfCases {
    private Integer id;

    private String unitName;

    private String organizationalCode;

    private String nameOfTheComplainant;

    private String idCard;

    private String phone;

    private Integer accountCharacter;

    private Integer age;

    private Integer sex;

    private String complaintContents;

    private String nameOfRegistrant;

    private String registrationTime;

    private String nameOfTheFiler;

    private Integer filingMonth;

    private String filingTime;

    private Integer approvalStatus;

    private Integer warningTime;

    private Integer numberOfAuditors;

    private Integer auditHouseholds;

    private Float amountPaid;

    private Integer typeStatus;

    private Integer maxtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }

    public String getOrganizationalCode() {
        return organizationalCode;
    }

    public void setOrganizationalCode(String organizationalCode) {
        this.organizationalCode = organizationalCode == null ? null : organizationalCode.trim();
    }

    public String getNameOfTheComplainant() {
        return nameOfTheComplainant;
    }

    public void setNameOfTheComplainant(String nameOfTheComplainant) {
        this.nameOfTheComplainant = nameOfTheComplainant == null ? null : nameOfTheComplainant.trim();
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getAccountCharacter() {
        return accountCharacter;
    }

    public void setAccountCharacter(Integer accountCharacter) {
        this.accountCharacter = accountCharacter;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getComplaintContents() {
        return complaintContents;
    }

    public void setComplaintContents(String complaintContents) {
        this.complaintContents = complaintContents == null ? null : complaintContents.trim();
    }

    public String getNameOfRegistrant() {
        return nameOfRegistrant;
    }

    public void setNameOfRegistrant(String nameOfRegistrant) {
        this.nameOfRegistrant = nameOfRegistrant == null ? null : nameOfRegistrant.trim();
    }

    public String getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(String registrationTime) {
        this.registrationTime = registrationTime == null ? null : registrationTime.trim();
    }

    public String getNameOfTheFiler() {
        return nameOfTheFiler;
    }

    public void setNameOfTheFiler(String nameOfTheFiler) {
        this.nameOfTheFiler = nameOfTheFiler == null ? null : nameOfTheFiler.trim();
    }

    public Integer getFilingMonth() {
        return filingMonth;
    }

    public void setFilingMonth(Integer filingMonth) {
        this.filingMonth = filingMonth;
    }

    public String getFilingTime() {
        return filingTime;
    }

    public void setFilingTime(String filingTime) {
        this.filingTime = filingTime == null ? null : filingTime.trim();
    }

    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public Integer getWarningTime() {
        return warningTime;
    }

    public void setWarningTime(Integer warningTime) {
        this.warningTime = warningTime;
    }

    public Integer getNumberOfAuditors() {
        return numberOfAuditors;
    }

    public void setNumberOfAuditors(Integer numberOfAuditors) {
        this.numberOfAuditors = numberOfAuditors;
    }

    public Integer getAuditHouseholds() {
        return auditHouseholds;
    }

    public void setAuditHouseholds(Integer auditHouseholds) {
        this.auditHouseholds = auditHouseholds;
    }

    public Float getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Float amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Integer getTypeStatus() {
        return typeStatus;
    }

    public void setTypeStatus(Integer typeStatus) {
        this.typeStatus = typeStatus;
    }

    public Integer getMaxtime() {
        return maxtime;
    }

    public void setMaxtime(Integer maxtime) {
        this.maxtime = maxtime;
    }

	@Override
	public String toString() {
		return "RegistrationOfCases [id=" + id + ", unitName=" + unitName + ", organizationalCode=" + organizationalCode
				+ ", nameOfTheComplainant=" + nameOfTheComplainant + ", idCard=" + idCard + ", phone=" + phone
				+ ", accountCharacter=" + accountCharacter + ", age=" + age + ", sex=" + sex + ", complaintContents="
				+ complaintContents + ", nameOfRegistrant=" + nameOfRegistrant + ", registrationTime="
				+ registrationTime + ", nameOfTheFiler=" + nameOfTheFiler + ", filingMonth=" + filingMonth
				+ ", filingTime=" + filingTime + ", approvalStatus=" + approvalStatus + ", warningTime=" + warningTime
				+ ", numberOfAuditors=" + numberOfAuditors + ", auditHouseholds=" + auditHouseholds + ", amountPaid="
				+ amountPaid + ", typeStatus=" + typeStatus + ", maxtime=" + maxtime + "]";
	}
    
    
}