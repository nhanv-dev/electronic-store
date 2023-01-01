package com.electronic.utils.digital_signature;


import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.StampingProperties;
import com.itextpdf.signatures.BouncyCastleDigest;
import com.itextpdf.signatures.DigestAlgorithms;
import com.itextpdf.signatures.IExternalDigest;
import com.itextpdf.signatures.IExternalSignature;
import com.itextpdf.signatures.PdfSignatureAppearance;
import com.itextpdf.signatures.PdfSigner;
import com.itextpdf.signatures.PrivateKeySignature;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.cert.Certificate;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class GenerateDigitalSignature {

    public static void sign(String src, String dest, Certificate[] chain, PrivateKey pk, String digestAlgorithm, String provider, PdfSigner.CryptoStandard signatureType, String reason, String location)
            throws GeneralSecurityException, IOException {

        PdfReader reader = new PdfReader(src);
        System.out.println(Files.newOutputStream(Paths.get(dest)).toString());
        PdfSigner signer = new PdfSigner(reader, Files.newOutputStream(Paths.get(dest)), new StampingProperties());
        // Create the signature appearance
        Rectangle rect = new Rectangle(36, 648, 200, 100);
        PdfSignatureAppearance appearance = signer.getSignatureAppearance();
        appearance.setReason(reason)
                .setLocation(location)
                .setReuseAppearance(false)
                .setPageRect(rect)
                .setPageNumber(1);
        signer.setFieldName("sig");

        IExternalSignature pks = new PrivateKeySignature(pk, digestAlgorithm, provider);
        IExternalDigest digest = new BouncyCastleDigest();

        signer.signDetached(digest, pks, chain, null, null, null, 0, signatureType);

    }

    public static void main(String[] args) throws Exception {
        String src = "D:\\bbb.pdf";
        String dest = "D:\\digital_signature.pdf";

        PublicKey publicKey = KeyReader.readPublicKey("D:\\public.key");
        PrivateKey privateKey = KeyReader.readPrivateKey("D:\\private.key");

        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        ks.load(Files.newInputStream(Paths.get("./src/main/resources/encryption/ks.jks")), "nhannhan".toCharArray());
        String alias = ks.aliases().nextElement();
        Certificate[] chain = ks.getCertificateChain(alias);
        Certificate cert = ks.getCertificate(alias);
        Key key = ks.getKey(alias, "nhannhan".toCharArray());

        System.out.println(cert.getPublicKey());
        System.out.println((PrivateKey) key);
        GenerateDigitalSignature.sign(src, dest, chain, privateKey, DigestAlgorithms.SHA256, provider.getName(),
                PdfSigner.CryptoStandard.CMS, "Test 1", "Ghent");
//        System.out.println(VerifyDigitalSignature.verify(dest));
    }
}
