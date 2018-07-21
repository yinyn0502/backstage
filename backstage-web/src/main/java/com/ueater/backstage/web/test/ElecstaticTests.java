package com.ueater.backstage.web.test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ueater.backstage.common.model.Movie;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.backstage.service.impl.SysUserService;
import com.ueater.backstage.web.main.Application;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.ElasticsearchException;
import org.elasticsearch.action.bulk.BulkItemResponse;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.get.MultiGetItemResponse;
import org.elasticsearch.action.get.MultiGetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.index.query.Operator;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.DocValueFormat;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AbstractAggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.range.Range;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.max.Max;
import org.elasticsearch.search.aggregations.metrics.max.MaxAggregationBuilder;
import org.elasticsearch.search.aggregations.metrics.min.Min;
import org.elasticsearch.search.aggregations.metrics.min.MinAggregationBuilder;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStats;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStatsAggregationBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

/**
 * Created by Administrator on 2017/9/8.
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class ElecstaticTests {
    protected org.slf4j.Logger logger = LoggerFactory.getLogger(ElecstaticTests.class);
    @Autowired
    private SysUserService sysUserService;

    TransportClient transportClient;
    //索引库名
    String index = "movies";
    //类型名称
    String type = "movie";

    String index1="products";

    String type1="product";

    String index2="users";

    String type2="user";

    @Before
    public void before() {

/**
 * 1:通过 setting对象来指定集群配置信息
 */Settings settings = Settings.builder().put("cluster.name", "ueater-escluster").put("client.transport.sniff", true).build();


/**
 * 2：创建客户端
 * 通过setting来创建，若不指定则默认链接的集群名为elasticsearch
 * 链接使用tcp协议即9300
 */

        try {
            transportClient = new PreBuiltTransportClient(settings).addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("172.16.70.108"), 9300));
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }


/**
 * 3：查看集群信息
 * 注意我的集群结构是：
 *   131的elasticsearch.yml中指定为主节点不能存储数据，
 *   128的elasticsearch.yml中指定不为主节点只能存储数据。
 * 所有控制台只打印了192.168.79.128,只能获取数据节点
 *
 *//*

        ImmutableList<DiscoveryNode> connectedNodes = transportClient.connectedNodes();
        for(DiscoveryNode node : connectedNodes)
        {
            System.out.println(node.getHostAddress());
        }

    }*/

    }


    @Test
    public void testGet() throws UnknownHostException{

        //搜索数据
        GetResponse response = transportClient.prepareGet("movies", "movie", "3").execute().actionGet();
        System.out.print(response.toString());
        transportClient.close();
    }


    @Test
    public void testPut1() throws UnknownHostException,IOException {

        IndexResponse response = transportClient.prepareIndex("movies", "movie", "1")
                .setSource(jsonBuilder()
                        .startObject()
                        .field("title", "kimchy")
                        .field("year", "2017")
                        .field("director", "trying out Elasticsearch")
                        .endObject()
                )
                .get();
        transportClient.close();
    }


    @Test
    public void testUpdate() throws IOException
    {
        XContentBuilder source = XContentFactory.jsonBuilder()
                .startObject()
                .field("title", "will")
                .endObject();

        UpdateResponse updateResponse = transportClient
                .prepareUpdate(index, type, "2").setDoc(source).get();

        System.out.println(updateResponse.getVersion());
    }


    public void testIndexUserJson(){
        List<SysUser> list= sysUserService.findAll();
        String jsonString=JsonUtil.list2json(list);

    }




/**
 * 通过prepareIndex增加文档，参数为json字符串
 */

    @Test
    public void testIndexJson()
    {
        String source = "{\"title\":\"friend\",\"year\":\"2012\",\"director\":\"the last day\"}";
        IndexResponse indexResponse = transportClient
                .prepareIndex(index, type, "3").setSource(source).get();
        System.out.println(indexResponse.getVersion());
    }


    /**
     * 通过Bulk执行批处理
     * @throws IOException
     */
    @Test
    public void testBulk() throws IOException
    {
        //1:生成bulk
        BulkRequestBuilder bulk = transportClient.prepareBulk();

        //2:新增
        List<SysUser> userLists=sysUserService.findAll();
        for(SysUser u:userLists){
            IndexRequest add = new IndexRequest("sysusers", "sysuser", u.getId().toString());
            add.source(XContentFactory.jsonBuilder()
                    .startObject()
                    .field("id", u.getId())
                    .field("companyId", u.getCompanyId())
                    .field("officeId",u.getOfficeId())
                    .field("loginName",u.getLoginName())
                    .field("createDate",u.getCreateDate())
                    .field("createBy",u.getCreateBy())
                    .field("email",u.getEmail())
                    .endObject());

            //add.source(JsonUtil.bean2json(u));
            bulk.add(add);
        }




      /*  //3:删除
        DeleteRequest del = new DeleteRequest(index, type, "1");

        //4:修改
        XContentBuilder source = XContentFactory.jsonBuilder().startObject().field("name", "jack_1").field("age", 19).endObject();
        UpdateRequest update = new UpdateRequest(index, type, "2");
        update.doc(source);

        bulk.add(del);*/
        /*bulk.add(add);
        bulk.add(update);*/
        //5:执行批处理
        BulkResponse bulkResponse = bulk.get();
        if(bulkResponse.hasFailures())
        {
            BulkItemResponse[] items = bulkResponse.getItems();
            for(BulkItemResponse item : items)
            {
                System.out.println(item.getFailureMessage());
            }
        }
        else
        {
            System.out.println("全部执行成功！");
        }
    }

  /*  @Test
    public void testBulkPut() throws IOException {
        //1:生成bulk
        BulkRequestBuilder bulk = transportClient.prepareBulk();

        //2:新增
        List<SysUser> userLists=sysUserService.findAll();
        for(SysUser u:userLists){
            IndexRequest add = new IndexRequest("sysusers", "sysuser", u.getId().toString());
            add.source(XContentFactory.jsonBuilder()
                    .startObject()
                    .field("name", "Henrry")
                    .field("age", 30)
                    .field()
                    .endObject());
            *//*add.source(JsonUtil.bean2json(u));*//*
            bulk.add(add);
        }
    }*/




/**
 * 通过prepareIndex增加文档，参数为Map<String,Object>
 */

    @Test
    public void testIndexMap()
    {
        Map<String, Object> source = new HashMap<String, Object>(3);
        source.put("title", "Alice");
        source.put("year", "2016");
        source.put("director","five days");
        IndexResponse indexResponse = transportClient
                .prepareIndex(index, type, "4").setSource(source).get();
        System.out.println(indexResponse.getVersion());
    }


/**
 * 通过prepareIndex增加文档，参数为javaBean
 *
 * @throws ElasticsearchException
 * @throws JsonProcessingException
 */

    @Test
    public void testIndexBean() throws ElasticsearchException, JsonProcessingException
    {
        Movie movie = new Movie();
        movie.setTitle("Fresh");
        movie.setYear("2005");
        movie.setDirector("First of the day");
        ObjectMapper mapper = new ObjectMapper();
        IndexResponse indexResponse = transportClient
                .prepareIndex(index, type, "5").setSource(mapper.writeValueAsString(movie)).get();
        System.out.println(indexResponse.getVersion());
    }


    /**
     * 通过prepareDelete删除文档
     */
    @Test
    public void testDelete()
    {
        String id = "AV5g0ihK8QD-CGst9R8R";
        DeleteResponse deleteResponse = transportClient.prepareDelete(index,
                type, id).get();

        System.out.println(deleteResponse.getVersion());

        //删除所有记录
       /* transportClient.prepareDeleteByQuery(index).setTypes(type)
                .setQuery(QueryBuilders.matchAllQuery()).get();*/
    }
    @Test
    public void multiGet(){
        MultiGetResponse multiGetItemResponses = transportClient.prepareMultiGet()
                .add(index, type, "1")
                .add(index, type, "2", "3", "4")
                //.add("another", "type", "foo")
                .get();

        for (MultiGetItemResponse itemResponse : multiGetItemResponses) {
            GetResponse response = itemResponse.getResponse();
            if (response.isExists()) {
                String json = response.getSourceAsString();
                System.out.println(json);
            }
        }

    }




/**
 * 通过prepareSearch查询索引库
 * setQuery(QueryBuilders.matchQuery("name", "jack"))
 * setSearchType(SearchType.QUERY_THEN_FETCH)
 *
 */
    @Test
    public void testSearch()
    {
        SearchResponse searchResponse = transportClient.prepareSearch(index)
                .setTypes(type)
                .setQuery(QueryBuilders.matchAllQuery()) //查询所有
                .setQuery(QueryBuilders.matchQuery("title", "kimchy").operator(Operator.AND)) //根据tom分词查询name,默认or
                //.setQuery(QueryBuilders.multiMatchQuery("tom", "name", "age")) //指定查询的字段
                //.setQuery(QueryBuilders.queryString("name:to* AND age:[0 TO 19]")) //根据条件查询,支持通配符大于等于0小于等于19
                //.setQuery(QueryBuilders.termQuery("name", "tom"))//查询时不分词
                .setSearchType(SearchType.QUERY_THEN_FETCH)
                //.setFrom(0).setSize(2)//分页
                .addSort("year", SortOrder.DESC)//排序
                .get();
        SearchHits hits = searchResponse.getHits();
        long total = hits.getTotalHits();
        System.out.println(total);
        SearchHit[] searchHits = hits.hits();
        for(SearchHit s : searchHits)
        {
            System.out.println(s.getSourceAsString());
        }
    }

    /**
     *多索引，多类型查询
     */
    @Test
    public void testSearchsAndTimeout()
    {
        SearchResponse searchResponse = transportClient.prepareSearch(index,index2).setTypes(type,type2)
                .setQuery(QueryBuilders.matchAllQuery())
                .setSearchType(SearchType.QUERY_THEN_FETCH)
                .setQuery(QueryBuilders.multiMatchQuery("2017-09-01 18:31:04", "createDate")) //指定查询的字段
                //.setQuery(QueryBuilders.multiMatchQuery("1", "createBy")) //指定查询的字段
                .setTimeout(new TimeValue(3))
                .get();

        SearchHits hits = searchResponse.getHits();
        long totalHits = hits.getTotalHits();
        System.out.println(totalHits);
        SearchHit[] hits2 = hits.getHits();
        for(SearchHit h : hits2)
        {
            System.out.println(h.getSourceAsString());
        }
    }



    /**
     * 过滤，
     * lt 小于
     * gt 大于
     * lte 小于等于
     * gte 大于等于
     *
     */

    @Test
    public void testFilter()
    {
        SearchResponse searchResponse = transportClient.prepareSearch(index2)
                .setTypes(type2)
                .setQuery(QueryBuilders.matchAllQuery()) //查询所有
                .setSearchType(SearchType.QUERY_THEN_FETCH)
//              .setPostFilter(FilterBuilders.rangeFilter("age").from(0).to(19)
//                      .includeLower(true).includeUpper(true))

                .setPostFilter(QueryBuilders.rangeQuery("createDate").gte("2017-09-01").lte("2017-09-05"))
                .setExplain(true) //explain为true表示根据数据相关度排序，和关键字匹配最高的排在前面
                .get();


        SearchHits hits = searchResponse.getHits();
        long total = hits.getTotalHits();
        System.out.println(total);
        SearchHit[] searchHits = hits.hits();
        for(SearchHit s : searchHits)
        {
            System.out.println(s.getSourceAsString());
        }
    }





/**
 * 分组
 */

    @Test
    public void testGroupBy()
    {
        SearchResponse searchResponse = transportClient.prepareSearch(index2).setTypes(type2)
                .setQuery(QueryBuilders.matchAllQuery())
                .setSearchType(SearchType.QUERY_THEN_FETCH)
                .addAggregation(AggregationBuilders.terms("group_age")
                        .field("officeId").size(0))//根据age分组，默认返回10，size(0)也是10
                .get();





       Terms terms = searchResponse.getAggregations().get("group_age");
       List<? extends Terms.Bucket> buckets=terms.getBuckets();

        for(Terms.Bucket bt : buckets)
        {
            System.out.println(bt.getKey() + " " + bt.getDocCount());
        }

    }


    /**
     * 查询工号为50到6666的OfficeID为5的人员名单
     */
    @Test
public void testAggregations(){
    SearchResponse response = transportClient.prepareSearch(index, index2)
            .setTypes(type, type2)
            .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
            .setQuery(QueryBuilders.termQuery("officeId", "5"))                 // Query
            .setPostFilter(QueryBuilders.rangeQuery("no").from(50).to(6666))     // Filter
            .setFrom(0).setSize(60).setExplain(true)
            .get();
    SearchHits hits = response.getHits();
    long total = hits.getTotalHits();
    System.out.println(total);
    SearchHit[] searchHits = hits.hits();
    for(SearchHit s : searchHits)
    {
        System.out.println(s.getSourceAsString());
    }
    }



    @Test
    public void testAggregationByFilter(){
        SearchResponse sr = transportClient.prepareSearch()
                .setTypes()
                .setQuery(QueryBuilders.matchAllQuery())
                .addAggregation(AggregationBuilders
                        .filter("agg", QueryBuilders.termQuery("delFlag", "0")))
                .get();
                Filter agg = sr.getAggregations().get("agg");
                logger.info("@@@@@@@@@@@@@@@@@@@@@"+agg.getDocCount()); // Doc count



    }

    /**
     * 根据日期范围获取,日期为数字
     */
    @Test
    public void testAggByFilter(){
           AggregationBuilder aggregation =
            AggregationBuilders
                    .dateRange("agg")
                    .field("year")
                    .format("YYYY")
                    .addUnboundedTo(2012)    // from -infinity to 1950 (excluded)
                    .addRange(2012,2016)  // from 1950 to 1960 (excluded)
                    .addUnboundedFrom(2016);
    SearchResponse sr = transportClient.prepareSearch(index)
            .setTypes(type)
            .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
            .addAggregation(aggregation)
            .get();
    Range agg = sr.getAggregations().get("agg");
        for (Range.Bucket entry : agg.getBuckets()) {
        String key = entry.getKeyAsString();                // Date range as key
        //DocValueFormat.DateTime fromAsDate = (DocValueFormat.DateTime) entry.getFrom();   // Date bucket from as a Date
        //DocValueFormat.DateTime toAsDate = (DocValueFormat.DateTime) entry.getTo();       // Date bucket to as a Date
        long docCount = entry.getDocCount();                // Doc count
        logger.info("key [{}], from [{}], to [{}], doc_count [{}]", key, docCount);
    }
}



@Test
    public void testTimeRange(){
        AggregationBuilder aggregation =
                AggregationBuilders
                        .dateHistogram("agg")
                        .field("createDate")
                        .dateHistogramInterval(DateHistogramInterval.days(3));

        SearchResponse sr = transportClient.prepareSearch(index2)
                .setTypes(type2)
                .setSearchType(SearchType.DEFAULT)
                .addAggregation(aggregation)
                .get();
        Histogram agg = sr.getAggregations().get("agg");

// For each entry
        for (Histogram.Bucket entry : agg.getBuckets()) {
            DocValueFormat.DateTime key = (DocValueFormat.DateTime) entry.getKey();    // Key
            String keyAsString = entry.getKeyAsString(); // Key as String
            long docCount = entry.getDocCount();         // Doc count

            logger.info("key [{}], date [{}], doc_count [{}]", keyAsString, key, docCount);
        }
    }
    /**
     * 3level
     */
    @Test
    public void testMinAggregation(){
        MinAggregationBuilder aggregation =
                AggregationBuilders
                        .min("agg")
                        .field("year");

        SearchResponse sr = transportClient.prepareSearch(index).setTypes(type).addAggregation(aggregation).get();
        Min agg = sr.getAggregations().get("agg");
        double value = agg.getValue();
        logger.info("@@@@@@@@@@@@@@minValue:"+value);



    }


    @Test
    public void testMaxAggregation(){
        MaxAggregationBuilder aggregation =
                AggregationBuilders
                        .max("agg")
                        .field("year");

        SearchResponse sr = transportClient.prepareSearch(index).setTypes(type).addAggregation(aggregation).get();
        Max agg = sr.getAggregations().get("agg");
        double value = agg.getValue();
        logger.info("@@@@@@@@@@@@@@maxValue:"+value);

    }
    @Test
    public void testExtendStats(){
        ExtendedStatsAggregationBuilder aggregation =
                AggregationBuilders
                        .extendedStats("agg")
                        .field("year");
        SearchResponse sr = transportClient.prepareSearch(index).setTypes(type).addAggregation(aggregation).get();
        ExtendedStats agg = sr.getAggregations().get("agg");
        double min = agg.getMin();
        double max = agg.getMax();
        double avg = agg.getAvg();
        double sum = agg.getSum();
        long count = agg.getCount();
        double stdDeviation = agg.getStdDeviation();
        double sumOfSquares = agg.getSumOfSquares();
        double variance = agg.getVariance();

        logger.info("min:"+min);
        logger.info("max:"+max);
        logger.info("avg:"+avg);
        logger.info("sum:"+sum);
        logger.info("count:"+count);
        logger.info("stdDeviation:"+stdDeviation);
        logger.info("sumOfSquares:"+sumOfSquares);
        logger.info("variance:"+variance);


    }

    /**
     * 多聚合查詢，查询名称为kimchy.在每年的分布情况
     */
    @Test
    public void testQuery(){
        QueryBuilder matchQuery = QueryBuilders.matchQuery("title", "kimchy");
        AbstractAggregationBuilder aggregation = AggregationBuilders.terms("per_year").field("year");
        SearchResponse response = transportClient.prepareSearch(index).setTypes(type)
                .setQuery(matchQuery)
                .addAggregation(aggregation)
                .execute()
                .actionGet();
        SearchHits hits = response.getHits();
        for(SearchHit hit:hits){
            System.out.println("id:"+hit.getId()+"\ttitle:"+hit.getSource().get("title"));
        }
        Terms terms = response.getAggregations().get("per_year");
        List<Terms.Bucket> buckets = (List<Terms.Bucket>) terms.getBuckets();
        for(Terms.Bucket bucket:buckets){
            System.out.println(bucket.getKey()+"----"+bucket.getDocCount());
        }
        transportClient.close();
    }


    @Test
    public void testU1serQuery(){

        SearchRequestBuilder search = transportClient.prepareSearch("sysusers").setTypes("sysuser");
        DateHistogramAggregationBuilder dateagg = AggregationBuilders.dateHistogram("agg");
        dateagg.field("createDate");//聚合时间字段
        dateagg.dateHistogramInterval(DateHistogramInterval.DAY);//按天聚合第一天的0点到第二天的0点
       /* dateagg.timeZone("Asia/Shanghai");
        dateagg.timeZone("Asia/Shanghai");//指定时区  */
        //dateagg.offset("+8h");//默认都是从0点开始计算一天的，通过这个offset，我们可以把第一天的6点到第二天的6点当做一天来聚合
        search.addAggregation(dateagg);

        Histogram hs= search.get().getAggregations().get("agg");
        List<Histogram.Bucket> buckets =   (List<Histogram.Bucket>) hs.getBuckets();//获取结果
        for(Histogram.Bucket bk:buckets){
            //下面的转化，也是因为默认是UTC的时间，所以我们要获取时间戳，自己转化
            System.out.println(bk.getKeyAsString());
        }
        transportClient.close();
    }
@Test
    public void testAgg(){
        SearchResponse sr = transportClient.prepareSearch()
                .setQuery(QueryBuilders.matchAllQuery())
                /*.addAggregation(
                        AggregationBuilders.terms("agg1").field("email")
                )*/
                .addAggregation(
                        AggregationBuilders.dateHistogram("agg2")
                                .field("createDate")
                                .dateHistogramInterval(DateHistogramInterval.days(10))
                )
                .execute().actionGet();

// Get your facet results
       //Terms agg1 = sr.getAggregations().get("agg1");
        Histogram agg2 = sr.getAggregations().get("agg2");

    //List<? extends Terms.Bucket> buckets = (List<Terms.Bucket>) agg1.getBuckets();
       /* for(Terms.Bucket bucket:buckets){
            System.out.println(bucket.getKey()+"----"+bucket.getDocCount());
        }*/



    List<Histogram.Bucket> bucketss =   (List<Histogram.Bucket>) agg2.getBuckets();//获取结果
    for(Histogram.Bucket bk:bucketss){
        //下面的转化，也是因为默认是UTC的时间，所以我们要获取时间戳，自己转化
        System.out.println(bk.getKeyAsString());
    }
    }

@Test
    public void testDateRange(){
        AggregationBuilder aggregation =
                AggregationBuilders
                        .dateRange("agg")
                        .field("createDate")
                        .format("yyyy")
                        .addUnboundedTo("2002")    // from -infinity to 1950 (excluded)
                        .addRange("2002", "2017")  // from 1950 to 1960 (excluded)
                        .addUnboundedFrom("2017"); // from 1960 to +infinity
        SearchResponse sr = transportClient.prepareSearch("sysusers")
                .setTypes("sysuser")
                .setQuery(QueryBuilders.matchAllQuery())
                .addAggregation(aggregation).execute().actionGet();
        Range agg = sr.getAggregations().get("agg");

// For each entry
        for (Range.Bucket entry : agg.getBuckets()) {
            String key = entry.getKeyAsString();                // Date range as key
            DocValueFormat.DateTime fromAsDate = (DocValueFormat.DateTime) entry.getFrom();   // Date bucket from as a Date
            DocValueFormat.DateTime toAsDate = (DocValueFormat.DateTime) entry.getTo();       // Date bucket to as a Date
            long docCount = entry.getDocCount();                // Doc count

            logger.info("key [{}], from [{}], to [{}], doc_count [{}]", key, fromAsDate, toAsDate, docCount);
        }
    }


@Test
    public void testRs() {
    Pattern p = Pattern.compile("(/d{3,5})([a-z]{2})");
    String s = "123aa-34345bb-234cc-00";
    Matcher m = p.matcher(s);
    while(m.find())
    {
        System.out.println("m.group():"+m.group()); //打印所有

        System.out.println("m.group(1):"+m.group(1)); //打印数字的

        System.out.println("m.group(2):"+m.group(2)); //打印字母的
        System.out.println();

    }
    System.out.println("捕获个数:groupCount()="+m.groupCount());
}






}







