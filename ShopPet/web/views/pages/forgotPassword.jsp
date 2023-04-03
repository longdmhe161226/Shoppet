<%-- 
    Document   : forgotPassword
    Created on : Mar 15, 2023, 10:00:43 PM
    Author     : khuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ForgotPassword Page</title>

        <style>


            .login-monday-body * {
                box-sizing: border-box;
            }
            .top-header-component {
                width: 100%;
                display: block;
                padding-top: 10px;
                padding-left: 8px;
                border-bottom: 1px solid #e0e0e0;
                height: 94px;
                background: #f7f7f7;
            }
            html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, input, video {
                font-weight: 200;
            }
            user agent stylesheet
            div {
                display: block;
            }
            .login-monday-content-component {
                height: 100%;
                display: flex;
                flex-direction: column;
                color: #333;
            }
            .login-monday-body {
                height: 100vh;
                width: 100vw;
                margin: 0;

            }
            body {
                line-height: 1;
            }

            .top-header-component .account-logo {
                /*width: 180px;*/
                height: 77px;
                margin-left: 22px;
            }

            user agent stylesheet
            img {
                overflow-clip-margin: content-box;
                overflow: clip;
            }


            .login-monday-content-component .router-wrapper {
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                align-items: center;
                flex-grow: 1;
                padding: 40px;
            }

            .login-monday-body {
                height: 100vh;
                width: 100vw;
                margin: 0;
            }
            .email-first-component {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 40px;
                margin-bottom: 16px;
                width: 100%;
                text-align: center;
            }

            user agent stylesheet
            div {
                display: block;
            }
            .login-monday-body {
                height: 100vh;
                width: 100vw;
                margin: 0;
            }

            .email-first-component .login-header {
                font-size: 40px;
                font-weight: var(--font-weight-very-light);
                margin-bottom: 8px;
            }

            user agent stylesheet
            h1 {
                display: block;
                font-size: 2em;
                margin-block-start: 0.67em;
                margin-block-end: 0.67em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;

            }
            .email-first-component {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 40px;
                margin-bottom: 16px;
                width: 100%;
                text-align: center;
            }
            .login-monday-body {
                height: 100vh;
                width: 100vw;
                margin: 0;
            }

            .email-first-component .email-page {
                margin-top: 28px;
            }
            .email-first-component .email-input-and-button-wrapper {
                width: 360px;
                margin-bottom: 32px;
            }

            .email-first-component .login-separator-wrapper {
                margin-bottom: 32px;
            }
            .login-separator-component {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .login-separator-component.split-line .separator-line {
                width: 200px;
                border: .5px solid #c5c7d0;
                margin: 16px;
            }
            .suggest-signup-wrapper {
                line-height: 3vh;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                transition: all 500ms ease;
            }
            a{
                text-decoration: none;
            }
            .next-wrapper,
            .icon_component {
                scale: 100px;
            }


        </style>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="login-monday-container" class="login-monday-container">
            <div class="login-monday-content-component">

                <div class="router-wrapper">
                    <div class="email-first-component">
                        <a href="home"><div ><img class="account-logo" style="margin-bottom: 44px"
                                                  src="${path}/assets/img/logonew.png" alt="Monday logo"></div></a>
                        <h1 class="login-header">Forgot your Password?</h1>
                        <form action="forgot-password" method="POST">
                            <div class="email-page">
                                <div class="email-input-and-button-wrapper" >
                                    <div class="email-input-wrapper">
                                        <div class="email-input-component">
                                            <label style="margin-top: 10px" class="enter-work-email" for="user_email">Enter your work email address</label>
                                            <input required style="width: 360px; height:  40px;margin-top: 10px;padding-left: 10px;"
                                                   id="user_email" type="email" class="email-input" placeholder="Example@abc.xyz"
                                                    name="email" >
                                            <div class="email-error-wrapper" style="margin-top: 20px">
                                                <div class="email-error" id="user_email_error" role=""></div>
                                                <h3 style="color: red">${msg}</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="next-button-component">
                                        <button type="submit"  class="next-button submit_button monday-style-button monday-style-button--size-medium monday-style-button--kind-primary monday-style-button--color-primary has-style-size" data-testid="button" aria-disabled="false" aria-busy="false" aria-label="Next" 
                                                style="width:360px; height:48px;display: flex;justify-content: center;align-items: center;color: white;background-color: #0073ea;border: 0;border-radius: 5px; ">
                                            <div class="next-wrapper">Next &nbsp;&nbsp;&nbsp;</div>
                                            <svg viewBox="0 0 20 20" fill="currentColor" width="20" height="20" aria-hidden="true" class="icon_component monday-style-button--right-icon icon_component--no-focus-style">
                                            <path d="M2.24999 10.071C2.24999 9.65683 2.58578 9.32104 2.99999 9.32104L15.3315 9.32105L10.7031 4.69273C10.4103 4.39983 10.4103 3.92496 10.7031 3.63207C10.996 3.33917 11.4709 3.33917 11.7638 3.63207L17.6725 9.54071C17.9653 9.83361 17.9653 10.3085 17.6725 10.6014L11.7638 16.51C11.4709 16.8029 10.996 16.8029 10.7031 16.51C10.4103 16.2171 10.4103 15.7423 10.7031 15.4494L15.3315 10.821L2.99999 10.821C2.58578 10.821 2.24999 10.4853 2.24999 10.071Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path>
                                            </svg>
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="login-separator-wrapper">
                            <div class="login-separator-component split-line"><span class="separator-line"></span>
                                Or Sign in with<span class="separator-line"></span>
                            </div>
                        </div>

                        <div class="suggest-signup-wrapper">
                            <div class="suggest-signup-component"><span class="suggest-signup-prefix">Don't have an account
                                    yet?</span><a class="page-link-component" tabindex="0" href="${path}/register">&nbsp;Sign Up</a></div>
                            <div class="login-support-link-component"><span class="login-support-link-prefix"> Can't log in?</span><a
                                    rel="noopener noreferrer"
                                    href="login"
                                    target="_blank">&nbsp;Sign In</a></div>
                        </div>
                        <div class="signed-on-accounts-wrapper"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
