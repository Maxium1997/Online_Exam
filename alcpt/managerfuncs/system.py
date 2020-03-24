from alcpt.models import User


def user_photo_storage(user: User, photo):
    user.photo.save(user.reg_id+"_{}".format(photo), photo, save=True)
