[Unit]
Description=Jacques de Laval's personal homepage
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=START_CMD
ExecStop=STOP_CMD

[Install]
WantedBy=local.target
