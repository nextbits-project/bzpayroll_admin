package com.payroll.publicuseraccess.file_upload.dto.com.file_upload;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.payroll.publicuseraccess.file_upload.dto.FileResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Component
public class FileUploadUtility {


    public static  final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    RestTemplate restTemplate;
    public FileResponseDTO uploadFileToRemoteStorage(MultipartFile file) throws IOException {
        MultiValueMap<String, Object> body = getStringObjectMultiValueMap(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        String uploadUrl = "https://bzcomposer.com/bucket/upload";

        ResponseEntity<String> response = restTemplate.postForEntity(uploadUrl, requestEntity, String.class);

        // Optionally: handle response status, parse JSON, etc.
        if (response.getStatusCode().is2xxSuccessful()) {
//                    return ResponseEntity.ok("File forwarded successfully: " + response.getBody());
            FileResponseDTO fileResponseDTO=  objectMapper.readValue(response.getBody(), FileResponseDTO.class);
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA:"+fileResponseDTO.getFilename()+":"+fileResponseDTO.getUrl());
            return  fileResponseDTO;
        }


        return  null;
    }

    private static MultiValueMap<String, Object> getStringObjectMultiValueMap(MultipartFile file) throws IOException {
        ByteArrayResource fileAsResource = new ByteArrayResource(file.getBytes()) {
            @Override
            public String getFilename() {
                // important: provide filename
                return file.getOriginalFilename();
            }

            @Override
            public long contentLength() {
                try {
                    return file.getSize();
                } catch (Exception e) {
                    return -1;
                }
            }
        };
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", fileAsResource);
        return body;
    }
}
