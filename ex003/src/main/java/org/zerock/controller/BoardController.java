package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * 
	 * log.info("list");
	 * 
	 * model.addAttribute("list", service.getList()); }
	 */
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list" + cri);
		
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:"+total);
		log.info(service.getList(cri));
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list1")
	public void list1(Criteria cri, Model model) {
		Long num = 1L;
		log.info("list" + cri+"----num-----"+num);
		
		model.addAttribute("list", service.getList1(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:"+total);
		log.info(service.getList1(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		
		log.info("list2" + cri);
		
		model.addAttribute("list", service.getList2(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:"+total);
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list3")
	public void list3(Criteria cri, Model model) {
		
		log.info("list2" + cri);
		
		model.addAttribute("list", service.getList3(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:"+total);
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list4")
	public void list4(Criteria cri, Model model) {
		
		log.info("list2" + cri);
		
		model.addAttribute("list", service.getList4(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:"+total);
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	
	/*
	 * MediaType.APPLICATION_XML_VALUE,xml蹂��� MediaType.APPLICATION_JSON_UTF8_VALUE
	 * json蹂���
	 */

	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<BoardVO>> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		log.info("getList...............");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);

		return new ResponseEntity<>(service.getList(cri), HttpStatus.OK);
	}

	
	
	@GetMapping(value = "/getjson/{bno}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BoardVO> get(@PathVariable("bno") Long bno){
		log.info("get get....." +bno);
		
		return new ResponseEntity<>(service.get(bno), HttpStatus.OK);
	}
	
	
	  @GetMapping(value = "/newbno", produces = { MediaType.APPLICATION_XML_VALUE,
	  MediaType.APPLICATION_JSON_UTF8_VALUE }) public ResponseEntity<BoardVO>
	  newbno() {
	
	  
	  
	  return new ResponseEntity<>(service.newbno(1L), HttpStatus.OK); }
	  
	  @GetMapping(value = "/newbno2/{page}", produces = {
	  MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	  public ResponseEntity<HashMap<Integer,Object>> newbno2(@PathVariable("page")
	 int page) { Criteria cri = new Criteria(page, 10); List<BoardVO> boardlist =
	  service.getList(cri); HashMap<Integer, Object> map = new HashMap();
	  map.put(1, boardlist); ResponseEntity<HashMap<Integer, Object>>
	  responseEntity = new ResponseEntity<>(map, HttpStatus.OK); return
	  responseEntity; }
	 
	  /*
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<BoardVO>> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		log.info("getList...............");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);

		return new ResponseEntity<>(service.getList(cri), HttpStatus.OK);
	}
	
	public ResponseEntity<HashMap<String, Object>> newbno2 (HttpServletRequest req, ModelMap model)

	{

	String bizNo = req.getParameter("bizNo");

		HashMap<String, Object> resultMap = new HashMap();

			List<Member> memberList = memberService.getMember(bizNo);

			resultMap.put("memberList", memberList);

			ResponseEntity<HashMap<String, Object>> responseEntity = new ResponseEntity<>(resultMap, HttpStatus.OK);

	return responseEntity;
*/
	
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("----------------------------");
		log.info("register: " + board);
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("----------------------------");
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}

	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> register(@RequestBody BoardVO board) {

		log.info("----------------------------");
		log.info("BoardVO " + board);
		log.info("----------------------------");
		service.register(board);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

		log.info("getAttachList " + bno);

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);

	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	

	
	@PostMapping(value = "/modify", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody BoardVO board) {

		log.info("----------------------------");
		log.info("BoardVO " + board);
		log.info("----------------------------");
		service.modify(board);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping(value = "/remove", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@RequestBody Long bno) {

		log.info("----------------------------");
		log.info("BoardVO " + bno);
		log.info("----------------------------");
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String writer) {

		log.info("remove..." + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	
	

	
	/*
	 * @PostMapping("/remove") public String remove(@RequestParam("bno") Long bno,
	 * Criteria cri, RedirectAttributes rttr, String writer) {
	 * 
	 * log.info("remove..." + bno);
	 * 
	 * List<BoardAttachVO> attachList = service.getAttachList(bno);
	 * 
	 * if (service.remove(bno)) {
	 * 
	 * // delete Attach Files deleteFiles(attachList);
	 * 
	 * rttr.addFlashAttribute("result", "success"); } return "redirect:/board/list"
	 * + cri.getListLink(); }
	 */

	private void deleteFiles(List<BoardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}
}
