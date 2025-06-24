❌ Error:

Missing "nss-config-dir" variable.
"/root/dead.letter"
. . . message not sent.

✅ Step-by-Step Fix:
##🔧 Step 1: Install nss-tools:
sudo yum install nss-tools -y

##🔧 Step 2: Create a Directory for NSS DB:
mkdir -p ~/.certs

##🔧 Step 3: Create NSS Certificate DB:
certutil -N -d sql:$HOME/.certs
##IMPORTANT: When it asks for a password, just press Enter (to keep it blank), unless you want to set one.

##🔧 Step 4: Set the Environment Variable:
export NSS_CONFIG_DIR=$HOME/.certs

##To make it permanent, add this line to your .bashrc:
echo 'export NSS_CONFIG_DIR=$HOME/.certs' >> ~/.bashrc
source ~/.bashrc
--------------------------------------------------------------------------------------
##Still issue persists:
##Check this version i should be like this 12.5 7/5/10 its a old version:
mail -V

✅ Solution: Install Modern s-nail (Gmail Compatible):
#🔧 Step 1: Remove Old Mail Client
sudo yum remove mailx -y

#🔧 Step 2: Install s-nail
sudo yum install s-nail -y
-----------------------------------------------------------------------------------------
#✅ Fix: Encode Special Characters in Email & Password:

vi .mailrc

set v15-compat
set mta="smtp://sakthisanjai9600%40gmail.com:zesuhddygmzzocte@smtp.gmail.com:587"
set from="sakthisanjai9600@gmail.com (Disk Monitor)"
set smtp-use-starttls
set record=/dev/null
#If your password has @, %, :, etc. — it must be encoded too.
---------------------------------------------------------------------------------------



