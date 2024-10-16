﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<MenuDirection>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm(); %>
    <text>
    <div class="configuration k-widget k-header">
        <span class="configHead">Direction Settings</span>
        <ul class="options">
            <li>
                <label for="direction">direction</label>

                <%= Html.Kendo().DropDownList()
                      .Name("direction")
                      .BindTo(new List<SelectListItem>
                      {
                          new SelectListItem { Text = "Bottom", Value = "0" },
                          new SelectListItem { Text = "Left", Value = "1" },
                          new SelectListItem { Text = "Right", Value = "2" },
                          new SelectListItem { Text = "Top", Value = "3" }
                      })
                      .SelectedIndex((int)Model)
                %>
            </li>
        </ul>
        <button class="k-button">Apply</button>
    </div>
    </text>
<% Html.EndForm(); %>

<%= Html.Kendo().Menu()
      .Name("Menu")
      .HtmlAttributes(new { style = "margin-right: 220px; width: 300px;" })
      .Items(items =>
      {
          items.Add()
              .Text("Mens")
              .Items(children =>
               {
                   children.Add().Text("Footwear")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Leisure Trainers");
                               innerChildren.Add().Text("Running Shoes");
                               innerChildren.Add().Text("Outdoor Footwear");
                               innerChildren.Add().Text("Sandals/Flip Flops");
                               innerChildren.Add().Text("Footwear Accessories");
                           });

                   children.Add().Text("Leisure Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("T-Shirts");
                               innerChildren.Add().Text("Hoodies & Sweatshirts");
                               innerChildren.Add().Text("Jackets");
                               innerChildren.Add().Text("Pants");
                               innerChildren.Add().Text("Shorts");
                           });

                   children.Add().Text("Sports Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Football");
                               innerChildren.Add().Text("Basketball");
                               innerChildren.Add().Text("Golf");
                               innerChildren.Add().Text("Tennis");
                               innerChildren.Add().Text("Swimwear");
                           });

                   children.Add().Text("Accessories");
               });

          items.Add().Text("Womens")
               .Items(children =>
               {
                   children.Add().Text("Footwear")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Leisure Trainers");
                               innerChildren.Add().Text("Running Shoes");
                               innerChildren.Add().Text("Outdoor Footwear");
                               innerChildren.Add().Text("Sandals/Flip Flops");
                               innerChildren.Add().Text("Footwear Accessories");
                           });

                   children.Add().Text("Leisure Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("T-Shirts");
                               innerChildren.Add().Text("Jackets");
                           });

                   children.Add().Text("Sports Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Basketball");
                               innerChildren.Add().Text("Golf");
                               innerChildren.Add().Text("Tennis");
                               innerChildren.Add().Text("Swimwear");
                           });

                   children.Add().Text("Accessories");
               });

          items.Add()
              .Text("Boys")
              .Items(children =>
              {
                  children.Add().Text("Footwear")
                          .Items(innerChildren =>
                          {
                              innerChildren.Add().Text("Leisure Trainers");
                              innerChildren.Add().Text("Running Shoes");
                              innerChildren.Add().Text("Outdoor Footwear");
                              innerChildren.Add().Text("Sandals/Flip Flops");
                              innerChildren.Add().Text("Footwear Accessories");
                          });

                  children.Add().Text("Leisure Clothing")
                          .Items(innerChildren =>
                          {
                              innerChildren.Add().Text("T-Shirts");
                              innerChildren.Add().Text("Hoodies & Sweatshirts");
                              innerChildren.Add().Text("Jackets");
                              innerChildren.Add().Text("Pants");
                              innerChildren.Add().Text("Shorts");
                          });

                  children.Add().Text("Sports Clothing")
                          .Items(innerChildren =>
                          {
                              innerChildren.Add().Text("Football");
                              innerChildren.Add().Text("Basketball");
                              innerChildren.Add().Text("Golf");
                              innerChildren.Add().Text("Tennis");
                              innerChildren.Add().Text("Swimwear");
                          });

                  children.Add().Text("Accessories");
              });

          items.Add().Text("Girls")
               .Items(children =>
               {
                   children.Add().Text("Footwear")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Leisure Trainers");
                               innerChildren.Add().Text("Running Shoes");
                               innerChildren.Add().Text("Outdoor Footwear");
                               innerChildren.Add().Text("Sandals/Flip Flops");
                               innerChildren.Add().Text("Footwear Accessories");
                           });

                   children.Add().Text("Leisure Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("T-Shirts");
                               innerChildren.Add().Text("Jackets");
                           });

                   children.Add().Text("Sports Clothing")
                           .Items(innerChildren =>
                           {
                               innerChildren.Add().Text("Basketball");
                               innerChildren.Add().Text("Golf");
                               innerChildren.Add().Text("Tennis");
                               innerChildren.Add().Text("Swimwear");
                           });

                   children.Add().Text("Accessories");
               });
      })
      .Direction(Model)
%>
</asp:Content>