#!/usr/bin/perl

$CURRENT_IP_FILE = "~/current_ip";
$LOG_FILE        = "ip_update.log";
$REMOTE_ADDR_CHK = "http://ieserver.net/ipcheck.shtml";
$DDNS_UPDATE     = "http://ieserver.net/cgi-bin/dip.cgi";

$ACCOUNT         = "uenomoon";
$DOMAIN          = "dip.jp";
$PASSWORD        = "123456";

if(!open(FILE,"$CURRENT_IP_FILE")) {
    $CURRENT_IP = '0.0.0.0';
} else {
    $CURRENT_IP = <FILE>;
    close FILE;
}

$NEW_IP = '0.0.0.0';
$NEW_IP = `wget -q -O - $REMOTE_ADDR_CHK`;

if ($NEW_IP ne "0.0.0.0" and $CURRENT_IP ne $NEW_IP) {

    $STATUS = `wget -q -O - '$DDNS_UPDATE?username=$ACCOUNT&domain=$DOMAIN&password=$PASSWORD&updatehost=1'`;

    if ($STATUS =~ m/$NEW_IP/) {    
        open (FILE ,">$CURRENT_IP_FILE");
        print FILE $NEW_IP;
        close FILE;
        $TIME = localtime;
        open (FILE ,">>$LOG_FILE");
        print FILE "$TIME $ACCOUNT.$DOMAIN Updated $CURRENT_IP to $NEW_IP\n";
        close FILE;
    } else {
        $TIME = localtime;
        open (FILE ,">>$LOG_FILE");
        print FILE "$TIME $ACCOUNT.$DOMAIN Update aborted $CURRENT_IP to $NEW_IP\n";
        close FILE;
    }
}
