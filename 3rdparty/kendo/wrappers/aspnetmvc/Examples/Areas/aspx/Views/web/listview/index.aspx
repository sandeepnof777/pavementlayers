<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.ProductViewModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<script type="text/x-kendo-tmpl" id="template">
    <div class="product">
        <img src="<%=Url.Content("~/content/web/foods/")%>${ProductID}.jpg" alt="${ProductName} image" />
        <h3>${ProductName}</h3>
        <dl>
            <dt>Price:</dt>
            <dd>${kendo.toString(UnitPrice, "c")}</dd>
        </dl>
    </div>
</script>

<%: Html.Kendo().ListView<Kendo.Mvc.Examples.Models.ProductViewModel>(Model)
    .Name("listView")
    .TagName("div")
    .ClientTemplateId("template")
    .DataSource(dataSource => {
        dataSource.Read(read => read.Action("Products_Read", "ListView"));
        dataSource.PageSize(12);
    })
    .Pageable()
%>

<style scoped>
    .product
    {
        float: left;
        width: 270px;
        height: 110px;
        margin: 10px;
        padding: 5px;
        -moz-box-shadow: inset 0 0 20px rgba(0,0,0,0.2);
        -webkit-box-shadow: inset 0 0 20px rgba(0,0,0,0.2);
        box-shadow: inner 0 0 20px rgba(0,0,0,0.2);
        -webkit-border-radius: 20px;
        -moz-border-radius: 20px;
        border-radius: 20px;

    }
    .product img
    {
        float: left;
        width: 110px;
        height: 110px;
        -webkit-border-radius: 15px;
        -webkit-border-top-right-radius: 0;
        -moz-border-radius: 15px;
        -moz-border-radius-topright: 0;
        border-radius: 15px;
        border-top-right-radius: 0;

    }
    .product h3
    {
        margin: 0;
        padding: 10px 10px 10px 15px;
        color: #fff;
        font-size: 1em;
        float: left;
        max-width: 110px;
        text-transform: uppercase;
        background-color: rgba(0,0,0,0.4);
        -moz-box-shadow: inset 0 0 20px rgba(0,0,0,0.2);
        -webkit-box-shadow: inset 0 0 20px rgba(0,0,0,0.2);
        box-shadow: inner 0 0 20px rgba(0,0,0,0.2);
        -moz-border-radius-topright: 10px;
        -moz-border-radius-bottomright: 10px;
        -webkit-border-top-right-radius: 10px;
        -webkit-border-bottom-right-radius: 10px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .product dl
    {
        float: left;
        margin: 15px 0 0 0;
    }
    .product dt, dd
    {
        float: left;
        margin: 0;
        padding: 0;
        width: 80px;
    }
    .product dt
    {
        clear: left;
        width: 30px;
        padding: 0 5px 0 15px;
        text-align: right;
        opacity: 0.6;
    }
    .k-listview:after, .product dl:after
    {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    .k-listview
    {
        border: 0;
        padding: 0 0 20px 0;
        min-width: 0;
    }
</style>
</asp:Content>
