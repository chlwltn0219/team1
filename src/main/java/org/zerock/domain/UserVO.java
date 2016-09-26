package org.zerock.domain;

public class UserVO {

  private String uid;
  private String upw;
  private String uname;
  private String sex;
  private int bir;
  private String conti;
  private int upoint;

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getUpw() {
    return upw;
  }

  public void setUpw(String upw) {
    this.upw = upw;
  }

  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }

  public int getUpoint() {
    return upoint;
  }

  public String getSex() {
	return sex;
}

public void setSex(String sex) {
	this.sex = sex;
}

public int getBir() {
	return bir;
}

public void setBir(int bir) {
	this.bir = bir;
}

public String getConti() {
	return conti;
}

public void setConti(String conti) {
	this.conti = conti;
}

public void setUpoint(int upoint) {
    this.upoint = upoint;
  }

  @Override
  public String toString() {
	  return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", sex=" + sex + ", bir=" + bir + ", conti=" + conti +", upoint=" + upoint + "]";
  }


}
