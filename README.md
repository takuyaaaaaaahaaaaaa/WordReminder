# WordReminder
エビングハウスの忘却曲線に合わせて英単語を教えてくれるアプリ

## 環境構築

1. dockerイメージの作成  
`docker build -t word-reminder .`
1. dockerコンテナの作成＊portは3000  
``docker run --name word-reminder-container -d -e "PORT=3000" -p 3000:3000 -v `pwd`:/go/src/github.com/go-server-dev -t word-reminder``
1. dockerコンテナ内にアクセス  
`docker exec <プロセスID> ash`
1. goの実行ファイル作成  
`go build main.go`
1. 実行  
`./main 3000`  
1. 別ターミナルで同じくコンテナに入り ngrok を 3000 で起動  
`ngrok http 3000`
1. ブラウザで表示された URL に接続し、「HelloWorld!!!」が出れば成功  
`...
Forwarding http://3fbffcc069d1.ngrok.io -> http://localhost:3010
Forwarding https://3fbffcc069d1.ngrok.io -> http://localhost:3010
...`
1. `./main 3000`を開いているターミナルに移り、`ctrl+C`でターミナルに戻り、main.goの以下部分にチャネルシークレット・チャネルアクセストークンを設定後、再度実行ファイル作成、実行する  
`
bot, err := linebot.New(
		// TODO: 開発者のLINEアカウントごとに変更する必要あり
		"チャネルシークレット",
		"チャネルアクセストークン",
	)
`