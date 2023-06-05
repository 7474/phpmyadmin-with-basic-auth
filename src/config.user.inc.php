<?php
// for PlanetScale
for ($i = 1; isset($hosts[$i - 1]); $i++) {
    $cfg['Servers'][$i]['ssl_ca'] = '/etc/ssl/certs/ca-certificates.crt';
    $cfg['Servers'][$i]['ssl'] = true;
}