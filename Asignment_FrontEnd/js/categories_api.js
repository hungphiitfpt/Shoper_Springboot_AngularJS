const host = "http://localhost:8080/rest";
const app = angular.module("MyApp", []);
app.controller("MyCtrl", function ($scope, $http) {
    //Checklogin
    let sessionLogin = sessionStorage.getItem("User");
    if (sessionLogin != null) {
        $scope.username = sessionLogin;
        $scope.login = true;
    } else {
        $scope.login = false;
    }
    $scope.logout = () => {
        sessionStorage.clear();
        localStorage.clear();
        location.replace("../categories.html");
    };
    const getSoLuongGioHang = () => {
        if(localStorage.getItem(sessionLogin)==null){
            return 0;
        }
        const gioHang = JSON.parse(localStorage.getItem(sessionLogin))|| [];
        console.log("localstore", gioHang);
        let soLuongGioHang = gioHang.reduce((accum, item) => accum + item.soLuong, 0)
        console.log("soluonggioHang", soLuongGioHang);
        return soLuongGioHang;
    };
    $scope.listGiay = [];
    $scope.load_all = function () {
        $scope.srcImage = `http://localhost:8080/rest/files/images`;
        const url = `${host}/giay`;
        $http.get(url).then((resp) => {
            $scope.listGiay = resp.data;
            console.log("Sucsess", resp.data);
            if (sessionLogin == null) {
                $scope.soLuongGioHang = 0;
            } else {
                $scope.soLuongGioHang = getSoLuongGioHang();
            }
            $scope.pageNumber = 1;
            $scope.limit = 8;
            $scope.totalPage = getTotalPage($scope.listGiay, $scope.limit);
        })
    }
    $scope.setLimit = (soSanPham) => {
        $scope.pageNumber = 1;
        $scope.limit = soSanPham;
        $scope.totalPage = getTotalPage($scope.listGiay, $scope.limit);
    };
    $scope.setPageNumber = (pageNumber) => {
        $scope.pageNumber = pageNumber;
    };
    $scope.next = () => {
        if ($scope.pageNumber < $scope.totalPage) {
            $scope.pageNumber++;
        } else {
            $scope.pageNumber = 1;
        }
    };
    const getTotalPage = (arr, soSanPham) => {
        return Math.ceil(arr.length / soSanPham);
    };
    $scope.detail = (giay) => {
        idGiay = giay.maGiay;
        location.replace("../detail.html?idGiay=" + idGiay);
    };
    $scope.addToCart = (giay) => {
        if (sessionLogin == null) {
            location.replace("../login.html?loginStatus=" + false);
        } else {
            const gioHangObj = {};
            const gioHang = JSON.parse(localStorage.getItem(sessionLogin)) || [];
            //Tìm vị trí giỏ hàng
            let viTri=-1;
            if(gioHang!=null){
                viTri = gioHang.findIndex((item, i) => {
                    return item.giay.maGiay === giay.maGiay
                });
            }
            if (viTri == -1) {
                gioHangObj.giay = giay;
                gioHangObj.soLuong = 1;
                gioHang.push(gioHangObj);
            } else {
                gioHang[viTri].soLuong += 1;
            }
            console.log("gh", gioHang)
            localStorage.setItem(sessionLogin, JSON.stringify(gioHang));
            $scope.soLuongGioHang = getSoLuongGioHang();
            console.log("localStore", JSON.parse(localStorage.getItem(sessionLogin)));
        }

    };

    $scope.load_all();
});
