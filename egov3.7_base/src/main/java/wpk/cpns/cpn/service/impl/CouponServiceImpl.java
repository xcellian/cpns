package wpk.cpns.cpn.service.impl;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import wpk.com.service.ComDefaultVO;
import wpk.com.service.ParkMasterVO;
import wpk.com.service.WpkComUtilService;
import wpk.cpns.cpn.service.CouponService;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 쿠폰관리에 관한비지니스클래스를 정의한다.
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
 *   2014.12.08	 이기하			암호화방식 변경(EgovFileScrty.encryptPassword)
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
@Service("cpnService")
public class CouponServiceImpl extends EgovAbstractServiceImpl implements CouponService {
	
	/** cpnDAO */
	@Resource(name="cpnDAO")
	private CouponDAO cpnDAO;
	
	/** cpnSeqGnrService */
	@Resource(name="cpnSeqGnrService")
	private EgovIdGnrService idgenService;
	
	/** WpkComUtilService */
	@Resource(name = "wpkComUtilService")
	private WpkComUtilService wpkComUtilService;
	
	/** EgovPropertyService */
	@Resource(name = "wpkPropertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 쿠폰 리스트 취득
	 * @param cpnSearchVO 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 */
	@Override
	public List<CouponVO> selectCpnList(ComDefaultVO cpnSearchVO) {
		return cpnDAO.selectCpnList(cpnSearchVO);
	}
	
	/**
	 * 전체 쿠폰 수 취득
	 * @param cpnSearchVO 검색조건
	 * @return int 전체 쿠폰 수
	 */
	@Override
	public int selectCpnListTotalCnt(ComDefaultVO cpnSearchVO) {
		return cpnDAO.selectCpnListTotalCnt(cpnSearchVO);
	}
	
	/**
	 * 주차장별 쿠폰 리스트 취득
	 * @param cpnSeq 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 */
	public List<CouponVO> selectCpnListByPark(ComDefaultVO cpnSearchVO) {
		return cpnDAO.selectCpnListByPark(cpnSearchVO);
	}
	
	/**
	 * 쿠폰 정보 취득
	 * @param cpnSeq 검색조건
	 * @return CouponVO 쿠폰 정보
	 */
	@Override
	public CouponVO selectCpn(String cpnSeq) {
		return cpnDAO.selectCpn(cpnSeq);
	}
	
	/**
	 * 쿠폰 정보 변경
	 * @param cpnVO 쿠폰 수정 정보
	 * @return int 변경 쿠폰 수
	 * @throws Exception
	 */
	@Override
	public int updateCpn(CouponVO cpnVO) throws Exception {
		return cpnDAO.updateCpn(cpnVO);
	}
	
	/**
	 * 쿠폰 코드 중복체크
	 * @param cpnVO 체크대상 쿠폰 정보
	 * @return int 중복 쿠폰 수
	 */
	@Override
	public int checkCpnCdDuplicate(CouponVO cpnVO) {
		return cpnDAO.checkCpnCdDuplicate(cpnVO);
	}
	
	/**
	 * 쿠폰 정보 등록
	 * @param cpnVO
	 * @return int 등록 쿠폰 수
	 * @throws Exception
	 */
	@Override
	public int insertCpn(CouponVO cpnVO) throws Exception {
		
		//주차장 검색
		ParkMasterVO parkVO = new ParkMasterVO();
		parkVO.setParkCd(cpnVO.getParkCd());
		parkVO = wpkComUtilService.selectPark(parkVO);
		
		//cpnSeq 설정
		String cpnSeq = idgenService.getNextStringId();
		cpnVO.setCpnSeq(propertiesService.getString("prefixCpnSeq") + parkVO.getAcsType() + cpnSeq);
		
		return cpnDAO.insertCpn(cpnVO);
	}
	
	/**
	 * 입주사 쿠폰 리스트 취득
	 * @param custCpnVO 검색조건
	 * @return List<CustCouponVO> 입주사 쿠폰 리스트
	 */
	public List<CustCouponVO> selectCustCouponList(CustCouponVO custCpnVO){
		return cpnDAO.selectCustCouponList(custCpnVO);
	}
	
	/**
	 * 입주사 쿠폰 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 쿠폰 수
	 * @throws Exception
	 */
	@Override
	public int insertCustCpn(CustVO custVO) throws Exception {
		
		//기등록 입주사 쿠폰삭제
		cpnDAO.deleteAllCustCpn(custVO);
		int retCnt = 0;
		for (int i = 0; i < custVO.getCustCpnList().length; i++) {
			CustCouponVO custCpnVO = custVO.getCustCpnList()[i];
			custCpnVO.setCustSeq(custVO.getCustSeq());
			custCpnVO.setRegId(custVO.getRegId());
			custCpnVO.setUpdtId(custVO.getUpdtId());
			
			//입주사 쿠폰 등록
			retCnt += cpnDAO.insertCustCpn(custCpnVO);
		}
		
		return retCnt;
	}
	
	/**
	 * 입주사 쿠폰 정보 전체 삭제
	 * @param custVO 입주사 정보
	 * @return int 삭제 입주사 쿠폰 수
	 * @throws Exception
	 */
	@Override
	public int deleteAllCustCpn(CustVO custVO) throws Exception {
		return cpnDAO.deleteAllCustCpn(custVO);
	}
	
	/**
	 * 입주사 쿠폰 정보 취득
	 * @param custCpnVO 검색조건
	 * @return CustCouponVO 입주사 쿠폰 정보
	 */
	@Override
	public CustCouponVO selectCustCpn(CustCouponVO custCpnVO) {
		return cpnDAO.selectCustCpn(custCpnVO);
	}
}