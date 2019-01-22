.class public Lnet/bluelotus/tomorrow/easyandroid/Crackme;
.super Ljava/lang/Object;
.source "Crackme.java"


# instance fields
.field private str2:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "cGhyYWNrICBjdGYgMjAxNg=="

    iput-object v0, p0, Lnet/bluelotus/tomorrow/easyandroid/Crackme;->str2:Ljava/lang/String;

    .line 23
    const-string v0, "sSNnx1UKbYrA1+MOrdtDTA=="

    invoke-direct {p0, v0}, Lnet/bluelotus/tomorrow/easyandroid/Crackme;->GetFlag(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    return-void
.end method

.method private GetFlag(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 27
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2, v3}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    .line 29
    .local v0, "content":[B
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lnet/bluelotus/tomorrow/easyandroid/Crackme;->str2:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2, v3}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 30
    .local v1, "kk":Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {p0, v0, v1}, Lnet/bluelotus/tomorrow/easyandroid/Crackme;->decrypt([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    const/4 v2, 0x0

    return-object v2
.end method

.method private decrypt([BLjava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "content"    # [B
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 35
    const/4 v4, 0x0

    .line 37
    .local v4, "m":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 38
    .local v3, "keyStr":[B
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v7, "AES"

    invoke-direct {v2, v3, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 39
    .local v2, "key":Ljavax/crypto/spec/SecretKeySpec;
    const-string v7, "AES/ECB/NoPadding"

    invoke-static {v7}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 40
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v7, 0x2

    invoke-virtual {v0, v7, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 41
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v6

    .line 42
    .local v6, "result":[B
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_3

    .end local v4    # "m":Ljava/lang/String;
    .local v5, "m":Ljava/lang/String;
    move-object v4, v5

    .line 46
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "key":Ljavax/crypto/spec/SecretKeySpec;
    .end local v3    # "keyStr":[B
    .end local v5    # "m":Ljava/lang/String;
    .end local v6    # "result":[B
    .restart local v4    # "m":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 43
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Ljava/security/GeneralSecurityException;
    :goto_1
    invoke-virtual {v1}, Ljava/security/GeneralSecurityException;->printStackTrace()V

    goto :goto_0

    .line 43
    .end local v1    # "e":Ljava/security/GeneralSecurityException;
    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_1
.end method
