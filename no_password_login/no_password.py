from Crypto.PublicKey import RSA
from cryptography.hazmat.primitives import serialization as crypto_serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.backends import default_backend as crypto_default_backend




def main():
    #key = RSA.generate(2048)
    #id_rsa = key.exportKey()
    #print(id_rsa)
    key = rsa.generate_private_key(
    backend=crypto_default_backend(),
    public_exponent=65537,
    key_size=2048
    )

    private_key = key.private_bytes(
        crypto_serialization.Encoding.PEM,
        crypto_serialization.PrivateFormat.PKCS8,
        crypto_serialization.NoEncryption()
    )

    public_key = key.public_key().public_bytes(
        crypto_serialization.Encoding.OpenSSH,
        crypto_serialization.PublicFormat.OpenSSH
    )

    print("private_key = ", private_key)
    print("public_key = ", public_key)
    id_rsa =  open("id_rsa", "wb")
    id_rsa.write(private_key)
    id_rsa.close()

    id_rsa_pub = open("id_rsa.pub", "wb")
    id_rsa_pub.write(public_key)
    id_rsa_pub.close()

    authorized_keys = open("authorized_keys", "wb")
    authorized_keys.write(public_key)
    authorized_keys.close()



if __name__ == "__main__":
    main()
    pass