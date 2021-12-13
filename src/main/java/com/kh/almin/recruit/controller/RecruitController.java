package com.kh.almin.recruit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.comments.model.service.CommentsService;
import com.kh.almin.myrecruit.model.service.MyRecruitService;
import com.kh.almin.myrecruit.model.vo.MyRecruit;
import com.kh.almin.recruit.controller.RecruitController;
import com.kh.almin.recruit.model.vo.LikeRecruit;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.ReportRecruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;
import com.kh.almin.resume.model.vo.MemberResume;
import com.kh.almin.recruit.model.service.RecruitService;

@Controller
@RequestMapping("/recruits")
@SessionAttributes("recruitgomsg")
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	@Autowired
	private CommentsService commentsService;

	private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);

	@GetMapping
	private ModelAndView viewRecruits(SearchRecruit searchRecruit, ModelAndView mv) throws Exception {
		List<Recruit> volist = null;
		List<Recruit> svolist = null;
		String msg = "";
		if (!ObjectUtils.isEmpty(searchRecruit) && searchRecruit.getRecruitJobDistrict() != 0) {
			svolist = recruitService.searchRecruit(searchRecruit);
			if (svolist == null || svolist.size() == 0) {
				msg = "검색 결과가 없습니다.";
				volist = recruitService.recruitList();
				mv.addObject("recruits", volist);
			}
			mv.addObject("msg", msg);
			mv.addObject("recruits", svolist);
		} else {
			volist = recruitService.recruitList();
			mv.addObject("recruits", volist);
		}
		mv.setViewName("recruits/jobinfoList");
		logger.info("공고 조회");
		return mv;
	}

	@GetMapping(value = "/myrecruits")
	private ModelAndView listLikes(ModelAndView mv) throws Exception {
		List<Recruit> volist = null;
		volist = recruitService.listLike("sy111k2");
		mv.addObject("recruits", volist);
		mv.setViewName("member/memberPage");
		logger.info("마이페이지-관심공고");
		return mv;
	}

	@GetMapping(value = "/appforyou")
	private ModelAndView appForYou(ModelAndView mv) throws Exception {
		List<Recruit> volist = null;
		volist = recruitService.appForYou("minzi91");
		mv.addObject("recruits", volist);
		mv.setViewName("member/appForYou");
		logger.info("마이페이지-맞춤공고");
		return mv;
	}

	@GetMapping(value = "/dislike")
	private String dislikeRecruit(LikeRecruit likeRecruit) throws Exception {
		likeRecruit.setMemberId("sy111k2");
		recruitService.dislikeRecruit(likeRecruit);
		return "redirect:/recruits/myrecruits";
	}

	@PostMapping(value = "/like")
	@ResponseBody
	private String likeRecruit(LikeRecruit likeRecruit) throws Exception {
		String result = "";
		int like = 0;
		likeRecruit.setMemberId("sy111k2");
		like = recruitService.dislikeRecruit(likeRecruit);
		if (like == 1) {
			System.out.println("찜 해제");
		} else if (like == 0) {
			recruitService.likeRecruit(likeRecruit);
			System.out.println("찜 등록");
		}
		result = String.valueOf(like); // 0: 찜 등록완료, 1. 찜 해제완료
		return result;
	}

	@PostMapping(value = "/report")
	@ResponseBody
	private String reportRecruit(ReportRecruit reportRecruit) throws Exception {
		String result = "";
		int report = 0;
		reportRecruit.setMemberId("sy111k2");
		int chkrpt = recruitService.checkReport(reportRecruit);
		System.out.println("chkrpt!!!!!! : " + chkrpt);

		if (chkrpt == 0) {
			report = recruitService.doReport(reportRecruit);
			recruitService.reportRecruit(reportRecruit.getRecruitNo());
			if (report == 1) {
				System.out.println("공고 신고");
			}
		}
		result = String.valueOf(report); // 1. 신고완료
		return result;
	}

	@GetMapping(value = "/detailjobinfo")
	public ModelAndView detailjobinfo(@RequestParam("recruitNo") int recruitNo, ModelAndView mv,
			@RequestParam(name = "msg", required = false) String msg) throws Exception {
		LikeRecruit likeRecruit = new LikeRecruit();
		Map<String, List<String>> commentsMap = null;
		likeRecruit.setMemberId("sy111k2");
		likeRecruit.setRecruitNo(recruitNo);
		int like = recruitService.checkLike(likeRecruit);
		try {
			commentsMap = commentsService.selectAllKeyWords();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("commentsMap", commentsMap);
		mv.addObject("detailjobinfo", recruitService.detailjobinfo(recruitNo));

		// 후기 입력에 필요한 recruitNo도 추가로 넘기겠습니다. - Hyun
		mv.addObject("recruitNo", recruitNo);
		if (like > 0) {
			mv.addObject("like", like);
		} else {
			mv.addObject("like", null);
		}
		mv.setViewName("recruits/detailjobinfo");
		return mv;
	}

	@GetMapping("recruitAdd")
	public String goRecruitAddPage(Model model) {

		return "recruits/recruitAdd";
	}

	@GetMapping("addrecruit")
	public ModelAndView insertRecruit(@RequestParam(value = "msg", required = false) String msg, Recruit r,
			ModelAndView mv, HttpServletRequest request) throws Exception {
		int result = recruitService.insertRecruit(r);
		System.out.println("r: " + r);
		if (result > 0) {
			mv.addObject("msg", "공고 등록이 되었습니다.");
			mv.setViewName("recruits/jobinfoList");
		} else {
			mv.addObject("msg", "공고 등록이 실패했습니다.다시 시도해주세요.");
			String referer = request.getHeader("Referer"); // 이전페이지로 이동
			mv.setViewName("redirect:" + referer);
		}

		return mv;

	}

	@GetMapping("updateRe")
	public ModelAndView goUpdateRecruit(@RequestParam("recruitNo") int recruitNo, ModelAndView mv) {
		try {
			mv.addObject("recruit", recruitService.detailjobinfo(recruitNo));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("recruits/updateRecruit");
		return mv;
	}

	@GetMapping("updateRecruit")
	public String updateRecruit(@RequestParam(value = "msg", required = false) String msg, Recruit r, Model m) {
		int result = -1;
		try {
			result = recruitService.updateRecruit(r);
		} catch (Exception e) {

			e.printStackTrace();
		}
		if (result > 0) {
			m.addAttribute("msg", "수정되었습니다.");
		} else {
			m.addAttribute("msg", "다시 시도해주세요.");
		}
		return "redirect:recruits";
	}

	@GetMapping("deleteResume")
	public String deleteRecruit(@RequestParam(value = "msg", required = false) String msg, int recruitNo, Model m) {
		int result = -1;
		try {
			result = recruitService.deleteRecruit(recruitNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			m.addAttribute("msg", "삭제되었습니다");
		} else {
			m.addAttribute("msg", "다시 시도해주세요.");
		}

		return "redirect:recruits";
	}

	@Autowired
	private MyRecruitService myRecruitService;

	// 공고 지원하기 버튼 클릭했을때 --> 개인 회원으로 로그인(받는 값 : 아이디 & 공고번호)
	@PostMapping("/recruitgo")
	public String recruitGo(MyRecruit myRecruit, Model model) {
		System.out.println("myRecruit : " + myRecruit);

		int result = 0;
		try {
			result = myRecruitService.recruitGo(myRecruit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {
			model.addAttribute("recruitgomsg", "지원 완료!!!");
		} else if (result == 0) {
			model.addAttribute("recruitgomsg", "지원 안됨");
		}
		return "redirect:/recruits/detailjobinfo?recruitNo=" + myRecruit.getRwmRecruitNo();
//		http://localhost:8090/almin/recruits/detailjobinfo?recruitNo=10
//		http://localhost:8090/almin/detailjobinfo?=10
	}

	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		// 나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv;
	}

}