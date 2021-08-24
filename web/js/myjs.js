function doLike(pid,uid)
{
    
    console.log(uid+","+pid)
    const d={
        pid:pid,
        uid:uid,
        operation:"insertLike"
    }
    
    $.ajax({
        url:"LikeServlet",
        data:d,
    success: function(data,textStatus,dqXHR)
    {
        console.log(data);
        if(data.trim()=='true')
        {
            let c=$('.like-counter').html();
            c++;
            $('.like-counter').html(c);
        }
    },
    error:function(dqXHR,textStatus,data)
    {
        console,log(data)
    }  
    })
    
}
