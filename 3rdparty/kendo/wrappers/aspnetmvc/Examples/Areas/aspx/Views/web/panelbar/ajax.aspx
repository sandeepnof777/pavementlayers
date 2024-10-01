<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="wrapper">
    <%= Html.Kendo().PanelBar()
        .Name("panelbar")
        .ExpandMode(PanelBarExpandMode.Single)
        .Items(panelbar =>
        {
            panelbar.Add().Text("BODY")
                .LoadContentFrom(Url.Content("~/Content/web/panelbar/ajax/ajaxContent1.html"));

            panelbar.Add().Text("ENGINE")
                .LoadContentFrom(Url.Content("~/Content/web/panelbar/ajax/ajaxContent2.html"));

            panelbar.Add().Text("TRANSMISSION")
                .LoadContentFrom(Url.Content("~/Content/web/panelbar/ajax/ajaxContent3.html"));

            panelbar.Add().Text("PERFORMANCE")
                .LoadContentFrom(Url.Content("~/Content/web/panelbar/ajax/ajaxContent4.html"));
        })
    %>
</div>
            
<div class="configuration configuration-horizontal-bottom">
    <p>Image courtesy of Aston Martin</p>
</div>

<style scoped>
    .wrapper {
        width: 310px;
        height: 400px;
        margin: 20px auto;
        padding: 75px 0 0 390px;
        background: url('<%= Url.Content("~/Content/web/panelbar/astonmartin.png")%>') no-repeat 0 50px transparent;
    }
    #panelbar {
        width: 300px;
    }
    #panelbar p {
        margin-left: 1em;
        margin-right: 1em;
    }
</style>
</asp:Content>