<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="background">
    <div class="window">
        <div class="popup">
            <%--<h2>${listDetail.wfSubject}</h2>--%>
            <h2>${modalTitle}</h2>
            <button class="close"><i class="fa-solid fa-xmark"></i></button>
                <div class="modal-content">
                    ${modalContent}
                </div>
         <%--   <div class="swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${listDetail.wfImgUrl1}" alt="이미지1"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                    <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                </div>
            </div>--%>
            <div class="swiper-button-prev"><i class="fa-solid fa-angle-left"></i></div>
            <div class="swiper-button-next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const galleryItems = document.querySelectorAll(".gallery > ul >  li");
        const openModalButton = document.querySelector(".open-modal");
        const modal = document.querySelector(".background");
        const closeButton = document.querySelector(".close");

        galleryItems.forEach((li, index) => {
            li.addEventListener('click', () => {
                swiper.slideTo(index, 0, false)
                showModal(modal);
            });
        });

        openModalButton.addEventListener('click', () => showModal(modal));
        closeButton.addEventListener('click', () => closeModal(modal));
    });
    const showModal = (modal) => {
        modal.classList.add("show") ;
        document.querySelector(".popup").classList.add("popup animate__animated animate__zoomIn animate__faster");
    }
    const closeModal = (modal) => {
        document.querySelector(".popup").classList.add("popup animate__animated animate__zoomOut animate__faster")
        setTimeout(function (){
            modal.classList.remove("show");
            document.querySelector(".popup").classList.remove("animate__animated", "animate__zoomIn", "animate__faster", "animate__zoomOut");
        },200)
    }
</script>