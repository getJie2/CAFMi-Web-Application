<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "data.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    		<%String nome = (String)session.getAttribute("nome");
        String cognome = (String)session.getAttribute("cognome");
        int id = (int)session.getAttribute("id"); %>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CAFMi | Pannello Dirigente</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- CSS -->
        <link href="pannelloCapoufficio/capo-index/capo-index-style.css" rel="stylesheet" />  
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="pannelloCapoufficio/capo-index/img/logo.png" />      
    </head>
    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="dirigente">
                <img src="pannelloCapoufficio/capo-index/img/logo-banner.png" alt="CAFMi logo-banner" width="100px" height="30px">
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                <p id="nomePannello" class="text-light">Accesso: <%out.print(cognome);%> <%out.print(nome); %></p>
                </div>
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="home">Home</a></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">

                            <div class="sb-sidenav-menu-heading">GESTIONE DEL PERSONALE</div>
                            <a class="nav-link" href="pannelloCapoufficio/capo-elencoDipendenti/capo-elencoDipendenti.jsp">
                            <a class="nav-link" href="e_dip">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-users"></i></div>
                                Elenco dipendenti
                            </a>

                            <div class="sb-sidenav-menu-heading">GESTIONE DELLA CLIENTELA</div>
                            <a class="nav-link" href="pannelloCapoufficio/capo-elencoClienti/capo-elencoClienti.jsp">
                            <a class="nav-link" href="e_cli">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-user-group"></i></div>
                                Elenco clienti
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <%int ruolo1 = (int)session.getAttribute("ruolo"); 
                        if(ruolo1 == 1){out.print("Dipendente: ");}
                        else if(ruolo1 == 2) {out.print("Manager: ");}
                        else if(ruolo1 == 3) {out.print("Capo Ufficio: ");}
                        %><br><%out.print(cognome);%> <%out.print(nome);%>
                        <div class="small">Login ID: <% out.print(id); %></div>
                    </div>
                </nav>
            </div>

            <!-- CONTENUTO DELLA PAGINA-->
            <div id="layoutSidenav_content">
            <% UserDAO acc = new UserDAO(); %>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Elenco dei clienti</h1>
                        
                        <table class="table table-striped">

                            <tbody>
                                <tr>
                                  <th scope="row">Cod.</th>
                                  <th scope="row">Nome</th>
                                  <th scope="row">Cognome</th>
                                  <th scope="row">Mostra info</th>
                                  <th scope="row">Aggiorna account</th>
                                  <th scope="row">Elimina account</th>
  
                                </tr>
                                <% for(int i = 0; i < acc.selectAllAccounts().size(); i++){ %>
                                <%int ruolo = acc.selectAllAccounts().get(i).getCod_ruolo(); %>
                                <%if (ruolo == 0){ %>
                                <tr>
                                  <td><% out.print(acc.selectAllAccounts().get(i).getCodice_cliente()); %></td>
                                  <td><% out.print(acc.selectAllAccounts().get(i).getNome()); %></td>
                                  <td><% out.print(acc.selectAllAccounts().get(i).getCognome()); %></td>
                                  <td><a href="view?codice_cliente=<%=acc.selectAllAccounts().get(i).getCodice_cliente() %>"><button type="button" class="btn btn-info">Visualizza info</button></td></a></td>
                                  <td><a href="edit?codice_cliente=<%=acc.selectAllAccounts().get(i).getCodice_cliente() %>"><button type="button" class="btn btn-secondary">Aggiorna account</button></td></a></td>
                                  <td><a href="delete?codice_cliente=<%=acc.selectAllAccounts().get(i).getCodice_cliente() %>&cod_ruolo=<%=ruolo %>"><button type="submit" class="btn btn-danger">Elimina account</button></a></td>
                                  
                              </tr>
                              <% } %>
                              <% } %>
                              </tbody>

                        </table>
                        

                    </div>

                 </main>
            </div>
                


            </div>
        </div>

        <!-- BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- JS X NAVBAR -->
        <script src="capo-elencoClienti-js.js"></script>
    </body>
</html>