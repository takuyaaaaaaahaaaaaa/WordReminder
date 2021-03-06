FROM alpine
RUN apk --no-cache add bash go git ca-certificates

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

# 下記作業ディレクトリを作成&移動
WORKDIR /go/src/github.com/go-server-dev

# sdkインストール
RUN go get github.com/line/line-bot-sdk-go/linebot

# Go言語パス設定
RUN export PATH=$PATH:/root/go/bin

# mockery（Go言語） インストール
#RUN cd /go/src/github.com/go-server-dev && go get github.com/vektra/mockery/v2

# ngrokインストール&解凍
RUN wget -P /usr/local/bin https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip /usr/local/bin/ngrok-stable-linux-amd64.zip -d /usr/local/bin
