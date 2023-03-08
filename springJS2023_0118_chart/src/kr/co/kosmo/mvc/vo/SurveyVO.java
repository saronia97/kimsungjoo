package kr.co.kosmo.mvc.vo;

import java.util.List;

public class SurveyVO {
	private int num;
	private int code;
	private int surveytotal;
	private String sub;
	private String sdate;

	private List<SurveyContentVO> subvey; // has a °ü°è

	public List<SurveyContentVO> getSubvey() {
		return subvey;
	}

	public void setSubvey(List<SurveyContentVO> subvey) {
		this.subvey = subvey;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getSurveytotal() {
		return surveytotal;
	}

	public void setSurveytotal(int surveytotal) {
		this.surveytotal = surveytotal;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

}
