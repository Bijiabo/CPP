@AudioInfo = new Mongo.Collection("audioInfo")
#stateLess or flux
@AudioInfoFlowType =  "flux" #"stateLess"

if @AudioInfo.find().count() == 0 && Meteor.isServer
  testAudoData = [
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/2/40n1sm74.audio",
          "Name": "第 1 集   两只老虎",
          "AudioLength": "00:02:30.9090000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "两只老虎",
      "Level": "P+",
      "FromAge": 0.0,
      "ToAge": 10.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/6/3zax5o5m.audio",
          "Name": "第 1 集   小燕子",
          "AudioLength": "00:02:12.8450000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "小燕子",
      "Level": "P-4",
      "FromAge": 0.0,
      "ToAge": 4.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/1/j79u5cak.audio",
          "Name": "第 1 集   幸福拍手歌",
          "AudioLength": "00:02:21.3490000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "幸福拍手歌",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/4/5bt85pez.audio",
          "Name": "第 1 集   小老鼠上灯台",
          "AudioLength": "00:02:14.0770000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "小老鼠上灯台",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/7/raaenvuf.audio",
          "Name": "第 1 集   祝你生日快乐",
          "AudioLength": "00:01:55.6960000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "祝你生日快乐",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/2/3go4w40n.audio",
          "Name": "第 1 集   我爱洗澡",
          "AudioLength": "00:02:54.2630000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "我爱洗澡",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/7/jb26nr36.audio",
          "Name": "第 1 集   拔萝卜",
          "AudioLength": "00:01:38.3100000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "拔萝卜",
      "Level": "P-4",
      "FromAge": 0.0,
      "ToAge": 4.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/5/ncyrgtfi.audio",
          "Name": "第 1 集   小毛驴",
          "AudioLength": "00:01:30.4360000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "小毛驴",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/3/r56b9fbq.audio",
          "Name": "第 1 集   蓝精灵",
          "AudioLength": "00:01:41.5750000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "蓝精灵",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/9/2ac4ik6.audio",
          "Name": "第 1 集   卖报歌",
          "AudioLength": "00:02:14.7660000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "卖报歌",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/3/y4wdaoh5.audio",
          "Name": "第 1 集   我的好妈妈",
          "AudioLength": "00:01:14.7000000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "我的好妈妈",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/0/iaho8wi.audio",
          "Name": "第 1 集   小兔子乖乖（儿歌版）",
          "AudioLength": "00:01:48.9710000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "小兔子乖乖（儿歌版）",
      "Level": "P-3",
      "FromAge": 0.0,
      "ToAge": 3.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    },
    {
      "AudioInfos": [
        {
          "Url": "http://aoss.appshare.cn/a/2/dceayyv9.audio",
          "Name": "第 1 集   一分钱",
          "AudioLength": "00:01:35.0330000"
        }
      ],
      "Tags": [
        "儿歌",
        "经典儿歌"
      ],
      "Name": "一分钱",
      "Level": "P-6",
      "FromAge": 0.0,
      "ToAge": 6.0,
      "Author": null,
      "Player": null,
      "Description": "共 1 集"
    }
  ]

  testAudoData.forEach (item)->
    AudioInfo.insert item

  ###
  for i in [10..1]
    @AudioInfo.insert {
      name  : "audioName"
      author  : "Audio Author"
      description : "Audio Descrption"
      quality : "Audio Quality"

      influence : {
        "0-1" : {
          sleep : "Influence to child -->> Age : 0-1 , Mode : Sleep"
          normal : "Influence to child -->> Age : 0-1 , Mode : Normal"
        }

        "1-2" : {
          sleep : "Influence to child -->> Age : 1-2 , Mode : Sleep"
          normal : "Influence to child -->> Age : 1-2 , Mode : Normal"
        }
      }

      resource : [
        {
          url : "http://xxxxxxx"
          usable : true
          speed : "high"
        },

        {
          url : "http://xxxxxxx"
          usable : false
          speed : "high"
        },

        {
          url : "http://xxxxxxx"
          usable : true
          speed : "low"
        }
      ]

    }

  ###

@AudioInfo.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : ()->true
}