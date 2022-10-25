package com.electronic.utils;

import com.electronic.model.Cart;
import com.electronic.model.User;
import com.electronic.model.WishList;
import com.electronic.service.ICartService;
import com.electronic.service.IUserService;
import com.electronic.service.IWishListService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.UserService;
import com.electronic.service.implement.WishListService;

import javax.servlet.http.HttpServletRequest;

public class AccountUtils {
    private final static IUserService userService = new UserService();
    private final static ICartService cartService = new CartService();
    private final static IWishListService wishListService = new WishListService();

    public static void handleSuccessLogin(HttpServletRequest request) {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user == null) return;

        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        Cart savedCart = cartService.findByUserId(user.getId());
        if (cart == null) cart = new Cart();
        if (savedCart == null) {
            savedCart = new Cart();
            savedCart.setUserId(user.getId());
            cartService.insert(savedCart);
        }
        savedCart.addAllItem(cart);

        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");
        WishList savedWishList = wishListService.findByUserId(user.getId());
        if (wishList == null) wishList = new WishList();
        if (savedWishList == null) {
            savedWishList = new WishList();
            savedWishList.setUserId(user.getId());
            wishListService.insert(savedWishList);
        }
        savedWishList.addAllItem(wishList);

        SessionUtils.getInstance().putValue(request, "user", user);
        SessionUtils.getInstance().putValue(request, "cart", savedCart);
        SessionUtils.getInstance().putValue(request, "wishList", savedWishList);
    }

    public static void handleSuccessLogout(HttpServletRequest request) {
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");

        if (cart != null) {
            cart.updateTotal();
            cart.updateAmount();
            cartService.insert(cart);
        }
        if (wishList != null) wishListService.insert(wishList);

        SessionUtils.getInstance().removeValue(request, "user");
        SessionUtils.getInstance().removeValue(request, "cart");
        SessionUtils.getInstance().removeValue(request, "wishList");
    }


}
