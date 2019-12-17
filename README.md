# docker-paitime

## 1. 启动服务发现、配置中心

```
docker-compose up -d consul vault
```

## 2. 进入 `vault` 执行

```
vault operator init
```

> 记录下输出结果 5个解密key 一个 vault token

## 3. 创建 `.env` 文件

```
VAULT_TOKEN=${vault token}
```

## 4. 打开 `http://localhost:38200` 进行 `vault` 解封，并进行配置

### 添加 kv 引擎 `cn.patime`

1. 添加全局 secret `cn.paitime.global`
```json
{
  "mysql": {
    "default": {
      "db": "paitime",
      "host": "mysql",
      "password": "RjwuGv12XSDaVsW7",
      "port": "3306",
      "user": "pt_user"
    },
    "other": {
      "db": "paitime",
      "host": "mysql",
      "password": "RjwuGv12XSDaVsW7",
      "port": "3306",
      "user": "pt_user"
    }
  },
  "redis": {
    "default": {
      "host": "redis",
      "password": "ptcnptcn",
      "port": "6379"
    },
    "other": {
      "host": "redis",
      "password": "ptcnptcn",
      "port": "6379"
    }
  }
}
```
2. 添加其他 secret (各服务独立配置)
    - cn.paitime.api.xxx
    - cn.paitime.srv.xxx

<details>
<summary>测试访问</summary>

```go
package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "http://localhost:38200/v1/cn.paitime/data/cn.paitime.global"

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("Authorization", "Bearer xxxxxxxxxxxxxxxxx")
	req.Header.Add("User-Agent", "PostmanRuntime/7.20.1")
	req.Header.Add("Accept", "*/*")
	req.Header.Add("Cache-Control", "no-cache")
	req.Header.Add("Postman-Token", "38f082a3-bc47-4f03-bf13-f902604c3239,b424d541-a359-4539-b1d1-fd0e16f45449")
	req.Header.Add("Host", "localhost:38200")
	req.Header.Add("Accept-Encoding", "gzip, deflate")
	req.Header.Add("Connection", "keep-alive")
	req.Header.Add("cache-control", "no-cache")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
```
</details>

## 5. 启动其他容器

```
docker-compose up -d
```

> 备注

- http://localhost:33000
- http://localhost:38200
- http://localhost:38500
- http://localhost:38080
- http://localhost:39090