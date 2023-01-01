package com.electronic.utils.digital_signature;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.signatures.PdfPKCS7;
import com.itextpdf.signatures.SignatureUtil;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;

public class VerifyDigitalSignature {

    public static boolean verify(String src, PublicKey publicKey) throws Exception {
        FileInputStream sigfis = new FileInputStream(src);
        byte[] sigToVerify = new byte[sigfis.available()];
        int index = sigfis.read(sigToVerify);
        sigfis.close();
        Signature sig = Signature.getInstance("SHA1withRSA");
        sig.initVerify(publicKey);
        FileInputStream datafis = new FileInputStream(src);
        BufferedInputStream bufin = new BufferedInputStream(datafis);
        byte[] buffer = new byte[1024];
        int len;
        while (bufin.available() != 0) {
            len = bufin.read(buffer);
            sig.update(buffer, 0, len);
        }
        bufin.close();
        boolean verifies = sig.verify(sigToVerify);
        System.out.println("signature verifies: " + verifies);
        return verifies;
    }

    public static boolean verify(String src) throws Exception {
        PdfDocument pdfDocument = new PdfDocument(new PdfReader(src));

        boolean genuineAndWasNotModified = false;

        String signatureFieldName = "Signature1";
        SignatureUtil signatureUtil = new SignatureUtil(pdfDocument);
        try {
            PdfPKCS7 signature1 = signatureUtil.readSignatureData(signatureFieldName);
            if (signature1 != null) {
                genuineAndWasNotModified = signature1.verifySignatureIntegrityAndAuthenticity();
            }
        } catch (Exception ignored) {
            // ignoring exceptions,
            // we are only interested in signatures that are passing the check successfully
        }
        pdfDocument.close();
        return genuineAndWasNotModified;
    }
}
