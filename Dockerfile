# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Cài đặt SSH server và các gói cần thiết
RUN apt update && apt install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd

# Cho phép root login qua SSH
RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Mở port SSH
EXPOSE 22

# Khởi động SSH server khi container chạy
CMD ["/usr/sbin/sshd", "-D"]
