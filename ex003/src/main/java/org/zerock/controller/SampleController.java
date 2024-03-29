package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

		@GetMapping(value="/getText",produces="text/plain; charset=UTF-8")
		public String getText() {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			return "�븞�뀞�븯�꽭�슂";
		}
		
		@GetMapping(value="/getSample",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE , MediaType.APPLICATION_ATOM_XML_VALUE})
		public SampleVO getSample() {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			return new SampleVO(112, "�뒪��","濡쒕뱶");
		}
		
		@GetMapping(value="/getSample2")
		public SampleVO getSample2() {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			return new SampleVO(112, "濡쒖폆","�씪荑�");
		}
		
		@GetMapping(value="/getList")
		public List<SampleVO> getList() {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			return IntStream.range(1,10).mapToObj(i -> new SampleVO(i,i+"First",i+"Last")).collect(Collectors.toList());
		}
		
		@GetMapping(value="/getMap")
		public Map<String, SampleVO> getMap() {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			Map<String, SampleVO> map = new HashMap<>();
			map.put("First", new SampleVO(111,"洹몃（�듃","二쇰땲�뼱"));
			
			return map;
		}
		
		@GetMapping(value="/check", params = {"height", "weight"})
		public ResponseEntity<SampleVO> check(Double height, Double weight) {
			log.info("MIME TYPE: "+MediaType.TEXT_PLAIN_VALUE);
			
			SampleVO vo = new SampleVO(0,""+ height,""+weight);
			
			ResponseEntity<SampleVO> result = null;
			
			if(height < 150) {
				result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
			} else {
				result = ResponseEntity.status(HttpStatus.OK).body(vo);
			}
			
			return result;
			
		}
		
		@GetMapping("/product/{cat}/{pid}")
		public String[] getPath(
				@PathVariable("cat") String cat,
				@PathVariable("pid") String pid) {
			return new String[] {"category: " + cat, "procuctid: "+pid};
		}
		
		@GetMapping("/ticket")
		public Ticket convert(@RequestBody Ticket ticket) {
			log.info("convert...........ticket"+ticket);
			
			return ticket;
		}
		
		@GetMapping("/all")
		public void doAll() {
			log.info("do all can access everybody");
		}
		
		@GetMapping("/member")
		public void doMember() {
			log.info("logined member");
		}
		
		@GetMapping("/admin")
		public void doadmin() {
			log.info("admin only");
		}
		
		@GetMapping("/member1")
		public void doMember1() {
			log.info("admin only");
		}
}
