package wpk.cpns.cust.service;

import java.util.List;

import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponVO;

/**
 * 일반회원관리에 관한 인터페이스클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
public interface CustService {
	
	/**
	 * 입주사 리스트 취득
	 * @param custSearchVO 검색조건
	 * @return List<CustVO> 입주사 리스트
	 * @throws Exception
	 */
	public List<CustVO> selectCustList(ComDefaultVO custSearchVO) throws Exception;
	
	/**
	 * 전체 입주사 수 취득
	 * @param custSearchVO 검색조건
	 * @return int 전체 입주사 수
	 * @throws Exception
	 */
	public int selectCustListTotalCnt(ComDefaultVO custSearchVO) throws Exception;
	
	/**
	 * 입주사 정보 취득
	 * @param custSeq 검색조건
	 * @return CustVO 입주사 정보
	 * @throws Exception
	 */
	public CustVO selectCust(String custSeq) throws Exception;
	
	/**
	 * 입주사 정보 변경
	 * @param custVO 입주사 수정 정보
	 * @return int 변경 입주사 수
	 * @throws Exception
	 */
	public int updateCust(CustVO custVO) throws Exception;
	
	/**
	 * 입주사 암호 초기화
	 * @param custVO 입주사 정보
	 * @return int 암호 초기화 입주사 수
	 * @throws Exception
	 */
	public int updatePassword(CustVO custVO) throws Exception;
	
	/**
	 * 입주사 아이디 중복체크
	 * @param custVO 중복체크 대상 입주사 정보
	 * @return int 중복 아이디 수
	 * @throws Exception
	 */
	public int checkIdDuplicate(CustVO custVO) throws Exception;
	
	/**
	 * 입주사 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 수
	 * @throws Exception
	 */
	public int insertCust(CustVO custVO) throws Exception;
	
}