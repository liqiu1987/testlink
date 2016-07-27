#!/bin/bash

rm -rf /app/testlink/install

echo "" >> /app/config.inc.php
echo "\$tlCfg->config_check_warning_mode = 'SILENT';" >> /app/config.inc.php