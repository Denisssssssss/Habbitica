package com.simbirsoft.habbitica.impl.controllers;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Profile("local")
@RestController
public class ImageControllerLocalImpl {

    @Value("${images.profile.path}")
    private String PROFILE_IMAGES_DIRECTORY;

    @Value("${images.achievements.path}")
    private String ACHIEVEMENTS_IMAGES_DIRECTORY;

    @GetMapping(value = "/data/img/photos/{image-name}")
    public ResponseEntity<Resource> getProfileImage(@PathVariable("image-name") String imgName) {

        return loadImage(imgName, PROFILE_IMAGES_DIRECTORY);
    }

    @GetMapping(value = "/data/img/achievements/{image-name}")
    public ResponseEntity<Resource> getAchievementImage(@PathVariable("image-name") String imgName) {

        return loadImage(imgName, ACHIEVEMENTS_IMAGES_DIRECTORY);
    }

    public ResponseEntity<Resource> loadImage(String imgName, String directory) {
        try {
            String dir = System.getProperty("user.dir") + directory;
            InputStream is = new FileInputStream(dir + imgName);
            byte[] bytes = IOUtils.toByteArray(is);
            ByteArrayResource byteArrayResource = new ByteArrayResource(bytes);
            return ResponseEntity.ok()
                    .contentLength(bytes.length)
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .body(byteArrayResource);
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }
}
