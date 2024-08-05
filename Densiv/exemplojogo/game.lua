md5=require('md5')

a="f3dfb60c4914ce1fc417898373c80799"
senha=io.read()
b=md5.sumhexa(senha)
print(a==b)
