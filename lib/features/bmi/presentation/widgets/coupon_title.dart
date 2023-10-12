import 'package:cached_network_image/cached_network_image.dart';
import 'package:bmi/features/bmi/domain/entities/coupon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponTitle extends StatelessWidget {

  final void Function(CouponEntity article) ? onCouponTap;
  final void Function(CouponEntity article) ? onCouponRemoved;
  final CouponEntity ? coupon;
  final bool ? isRemovable;

  const CouponTitle({
    Key ? key,
    this.coupon,
    this.onCouponTap,
    this.onCouponRemoved,
    this.isRemovable
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 4,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
            //_buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if(coupon?.urlToImage == null || coupon!.urlToImage!.isEmpty){
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 5,
            height: MediaQuery.of(context).size.width / 5,
            child: CupertinoActivityIndicator(),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
          ),
        ),
      );
    } else {
      return CachedNetworkImage(
          imageUrl: coupon!.urlToImage!,
          imageBuilder: (context, imageProvider) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    height: double.maxFinite,
                    child: CupertinoActivityIndicator(),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              ),
          errorWidget: (context, url, error) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    height: double.maxFinite,
                    child: Icon(Icons.error),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              )
      );
    }
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              coupon!.name ?? '',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  coupon!.description ?? '',
                  maxLines : 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  coupon!.category ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onCouponTap != null) {
      onCouponTap!(coupon!);
    }
  }

  void _onRemove() {
    if (onCouponTap != null) {
      onCouponRemoved!(coupon!);
    }
  }
}
