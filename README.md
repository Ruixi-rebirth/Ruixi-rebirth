#### Hey 👋, I'm [Ruixi-rebirth!](https://ruixi.me)  


<table border="0">
  <tr>
    <td>
      <a href="#TOP">
         <img align="left" alt="GIF" src="https://media.giphy.com/media/836HiJc7pgzy8iNXCn/giphy.gif" />
      </a>
    </td>
    <td>
      <a href="#TOP">
        <img src="https://github-readme-stats.vercel.app/api?username=Ruixi-rebirth&count_private=true&show_icons=true&theme=dracula&hide_border=true" style="color:gray;cursor:pointer;pointer-events:none;">
      </a>
    </td>   
 </tr>
</table>


```golang
package main

import (
	"fmt"
)

type Status map[string]string

func main() {
	for j, k := range GetStatus() {
		fmt.Printf("%+v: %+v\n", j, k)
	}
}

func GetStatus() Status {
	return Status{
		"- 🍎 I’m currently working on":      "Pending...",
		"- 🌱 I’m currently learning":        "Golang, Linux, Computer network, Html, Css",
		"- 🥣 I’m looking to collaborate on": "Python, Golang and Docker related projects",
		"- 🤔 I’m looking for help with":     "Anything related to what I am currently learning 😅",
		"- 💬 Ask me about":                  "😃I'm so suck， so shouldn't get the result you want",
		"- 🍡 How to reach me":               "https://ruixi.me",

	}
}
```




