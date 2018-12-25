#!/bin/zsh
confPath=/usr/local/etc/nginx/nginx.conf
echo "1. 启动nginx"
echo "2. 停止nginx"
echo "3. 重启nginx"
echo "4. 切换线上www.justfun.live代理"
echo "5. 切换测试test.www.justfun.live代理"
echo "请输入数字进行操作：" && read type
case $type in
    1)
	    echo "正在启动......" &&
        sudo nginx &&
        echo "启动成功......"
    ;;
    2)
	    echo "正在停止......" &&
        sudo nginx -s stop &&
        echo "停止成功......"
    ;;
    3)
        echo "正在重启......" &&
        sudo nginx -s reload &&
        echo "重启成功......"
    ;;
    4)
        echo "切换中......" &&
        if [ "`grep "test" $confPath`" ]
        then
            sed -ig 's/test\.www\.justfun\.live/www\.justfun\.live/g' $confPath &&
            sudo nginx -s reload &&
            echo "切换成功"
        else
            echo "已在线上"
        fi
    ;;
    5)
        echo "切换中......" &&
        if [ "`grep "test" $confPath`" ]
        then
            echo "已在test上"
        else
            sed -ig 's/www\.justfun\.live/test\.www\.justfun\.live/g' $confPath &&
            sudo nginx -s reload &&
            echo "切换成功"
        fi
    ;;
    *)
        echo "没有这个操作呀......"
    ;;
esac
