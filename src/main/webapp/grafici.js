jQuery.get("/film/stats", function(data) {
  //console.log("Data: " + data + "\nStatus: " + status);

var obj = (JSON.parse(data));

  // USO QUESTO CICLO PER PASSARE ALLA LEGENDA I NOMI DEI VARI GENERI

  var nomi = {data: []};

  for(var i=0;i<obj.length;i++){
      nomi.data.push(obj[i].name);}



  var myChart = echarts.init(document.getElementById('generi'));


  var option = {
      title : {
          text: 'QUESTO GRAFICO MOSTRA QUALI SONO I TUOI GENERI PREFERITI',
          x:'center'
      },
      tooltip : {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
          x : 'right',
          y : 'bottom',

          data:nomi.data
      }
      /*,
      toolbox: {
          show : true,
          feature : {
              mark : {show: true},
              dataView : {show: true, readOnly: false},
              magicType : {
                  show: true,
                  type: ['pie', 'funnel']
              },
              restore : {show: true},
              saveAsImage : {show: true}
          }
      }
   ,
    calculable : true*/,
      series : [
          {
              name:'genere',
              type:'pie',
              radius : [40, 110],
              center : ['50%', '55%'],
              roseType : 'radius',
              label: {
                normal: {
                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                    backgroundColor: '#eee',
                    borderColor: '#aaa',
                    borderWidth: 2,
                    borderRadius: 4,
                    //shadowBlur:3,
                    // shadowOffsetX: 2,
                    // shadowOffsetY: 2,
                    // shadowColor: '#999',
                    // padding: [0, 7],
                    rich: {
                        a: {
                            color: '#999',
                            lineHeight: 20,
                            align: 'center'
                        },
                        // abg: {
                        //     backgroundColor: '#333',
                        //     width: '100%',
                        //     align: 'right',
                        //     height: 22,
                        //     borderRadius: [4, 4, 0, 0]
                        // },
                        hr: {
                            borderColor: '#aaa',
                            width: '100%',
                            borderWidth: 0.5,
                            height: 0
                        },
                        b: {
                            fontSize: 16,
                            lineHeight: 33
                        },
                        per: {
                            color: '#eee',
                            backgroundColor: '#334455',
                            padding: [2, 4],
                            borderRadius: 2
                        }
                    }
                }
            },
              lableLine: {
                  normal: {
                      show: true
                  },
                  emphasis: {
                      show: false
                  }
              },
              data:obj
          }
      ]
  };

  myChart.setOption(option);



});

