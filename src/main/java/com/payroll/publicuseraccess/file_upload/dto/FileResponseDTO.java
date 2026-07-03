package com.payroll.publicuseraccess.file_upload.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class FileResponseDTO implements Serializable {
    @JsonProperty("filename")
    private String filename;
    @JsonProperty("url")
    private String url;


}
