package board.spring.mybatis;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	// 스프링 bean = POJO 형태 = 자바 기본 클래스 형태
	
	// 회원정보 - members 아이디, 암호, 이름, 이메일, 전화번호, 가입시간
	// html 태그에서 사용했던 name 속성과 동일하게 하면 헷갈리지 않음
	String memberId;
	String pw;
	String memberName;
	String phone;
	String email;
	String regdate;

	// xml 파일에서 <bean id="dto1" class="member.MemberDTO" />는 무조건 기본 생성자 호출
	public MemberDTO() {
		System.out.println("MemberDTO 기본 생성자 호출");
	}

	public MemberDTO(String memberId, String memberName, String phone, String email, String regdate) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
	}

	public MemberDTO(String memberId, String pw, String memberName, String phone, String email, String regdate) {
		super();
		this.memberId = memberId;
		this.pw = pw;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
