PGDMP         $                {            plastictoys    13.10    13.10 E               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    16571    plastictoys    DATABASE     h   CREATE DATABASE plastictoys WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE plastictoys;
                postgres    false            �            1259    16622    cart    TABLE        CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer,
    product_id integer NOT NULL,
    count integer
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    16620    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    205                       0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    204            �            1259    16863    makets    TABLE       CREATE TABLE public.makets (
    id integer NOT NULL,
    user_id integer,
    file_url character varying,
    price integer,
    status character varying,
    accept_status integer,
    original_file_name character varying,
    address character varying
);
    DROP TABLE public.makets;
       public         heap    postgres    false            �            1259    16861    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    215                       0    0    customers_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.customers_id_seq OWNED BY public.makets.id;
          public          postgres    false    214            �            1259    16635 	   favorites    TABLE     q   CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer,
    product_id integer NOT NULL
);
    DROP TABLE public.favorites;
       public         heap    postgres    false            �            1259    16633    favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.favorites_id_seq;
       public          postgres    false    207                       0    0    favorites_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;
          public          postgres    false    206            �            1259    16824    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer,
    user_id integer,
    product_id integer,
    status character varying(255),
    address character varying(255)
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16822    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    213                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    212            �            1259    16611    p_user    TABLE     �   CREATE TABLE public.p_user (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    username character varying(255),
    password character varying(255),
    role integer,
    email character varying(255)
);
    DROP TABLE public.p_user;
       public         heap    postgres    false            �            1259    16609    p_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.p_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.p_user_id_seq;
       public          postgres    false    203                       0    0    p_user_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.p_user_id_seq OWNED BY public.p_user.id;
          public          postgres    false    202            �            1259    16574    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255),
    price integer,
    count integer,
    img character varying,
    aboutproduct character varying,
    type integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16572    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    201                       0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    200            �            1259    16713    role    TABLE     u   CREATE TABLE public.role (
    id integer NOT NULL,
    value character varying DEFAULT 'user'::character varying
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    16711    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    211                       0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    210            �            1259    16687    type    TABLE     V   CREATE TABLE public.type (
    id integer NOT NULL,
    type character varying(30)
);
    DROP TABLE public.type;
       public         heap    postgres    false            �            1259    16685    type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.type_id_seq;
       public          postgres    false    209                       0    0    type_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;
          public          postgres    false    208            S           2604    16625    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            T           2604    16638    favorites id    DEFAULT     l   ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);
 ;   ALTER TABLE public.favorites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            Y           2604    16866 	   makets id    DEFAULT     i   ALTER TABLE ONLY public.makets ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 8   ALTER TABLE public.makets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            X           2604    16827 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            R           2604    16614 	   p_user id    DEFAULT     f   ALTER TABLE ONLY public.p_user ALTER COLUMN id SET DEFAULT nextval('public.p_user_id_seq'::regclass);
 8   ALTER TABLE public.p_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            Q           2604    16577 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            V           2604    16716    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            U           2604    16690    type id    DEFAULT     b   ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);
 6   ALTER TABLE public.type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �          0    16622    cart 
   TABLE DATA           >   COPY public.cart (id, user_id, product_id, count) FROM stdin;
    public          postgres    false    205   �J       �          0    16635 	   favorites 
   TABLE DATA           <   COPY public.favorites (id, user_id, product_id) FROM stdin;
    public          postgres    false    207   K                 0    16863    makets 
   TABLE DATA           r   COPY public.makets (id, user_id, file_url, price, status, accept_status, original_file_name, address) FROM stdin;
    public          postgres    false    215   pK                 0    16824    orders 
   TABLE DATA           Q   COPY public.orders (id, count, user_id, product_id, status, address) FROM stdin;
    public          postgres    false    213   zL       �          0    16611    p_user 
   TABLE DATA           T   COPY public.p_user (id, name, surname, username, password, role, email) FROM stdin;
    public          postgres    false    203   �M       �          0    16574    product 
   TABLE DATA           R   COPY public.product (id, name, price, count, img, aboutproduct, type) FROM stdin;
    public          postgres    false    201   �Q                  0    16713    role 
   TABLE DATA           )   COPY public.role (id, value) FROM stdin;
    public          postgres    false    211   �V       �          0    16687    type 
   TABLE DATA           (   COPY public.type (id, type) FROM stdin;
    public          postgres    false    209    W                  0    0    cart_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cart_id_seq', 486, true);
          public          postgres    false    204                       0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 13, true);
          public          postgres    false    214                       0    0    favorites_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.favorites_id_seq', 170, true);
          public          postgres    false    206                       0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 27, true);
          public          postgres    false    212                       0    0    p_user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.p_user_id_seq', 25, true);
          public          postgres    false    202                       0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 18, true);
          public          postgres    false    200                       0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 2, true);
          public          postgres    false    210                       0    0    type_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.type_id_seq', 4, true);
          public          postgres    false    208            _           2606    16627    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    205            i           2606    16871    makets customers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.makets
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.makets DROP CONSTRAINT customers_pkey;
       public            postgres    false    215            a           2606    16640    favorites favorites_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_pkey;
       public            postgres    false    207            g           2606    16829    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    213            ]           2606    16619    p_user p_user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.p_user
    ADD CONSTRAINT p_user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.p_user DROP CONSTRAINT p_user_pkey;
       public            postgres    false    203            [           2606    16582    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    201            e           2606    16722    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    211            c           2606    16692    type type_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.type DROP CONSTRAINT type_pkey;
       public            postgres    false    209            m           2606    16737    cart cart_product_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 C   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_product_id_fkey;
       public          postgres    false    2907    205    201            l           2606    16628    cart cart_user_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.p_user(id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          postgres    false    205    203    2909            r           2606    16872    makets customers_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.makets
    ADD CONSTRAINT customers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.p_user(id);
 G   ALTER TABLE ONLY public.makets DROP CONSTRAINT customers_user_id_fkey;
       public          postgres    false    215    2909    203            o           2606    16742 #   favorites favorites_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 M   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_product_id_fkey;
       public          postgres    false    2907    201    207            n           2606    16641     favorites favorites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.p_user(id);
 J   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_user_id_fkey;
       public          postgres    false    207    203    2909            q           2606    16835    orders orders_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_product_id_fkey;
       public          postgres    false    2907    201    213            p           2606    16830    orders orders_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.p_user(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    2909    203    213            k           2606    16723    p_user p_user_role_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.p_user
    ADD CONSTRAINT p_user_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 A   ALTER TABLE ONLY public.p_user DROP CONSTRAINT p_user_role_fkey;
       public          postgres    false    2917    203    211            j           2606    16693    product product_type_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_fkey FOREIGN KEY (type) REFERENCES public.type(id);
 C   ALTER TABLE ONLY public.product DROP CONSTRAINT product_type_fkey;
       public          postgres    false    201    2915    209            �   +   x�3�0�42�44�4�2�0��lS0��6�̀�=... � �      �   B   x��� !Cѳ)f�������X��7�AkL�ڀ��:�,�8�mRc�f�z�������� ��9�         �   x���_j�@��'�����M�{����VE-ZhC^�R�z�^!"$�^`�F�h�W����0��f�?�fi��%��rڶ�ӹ�M���^F�r������>oq�E�7\�w.|΅�?�����]��<�9�Sr=ϝ���Ê�VC��ȸ�n�]
�P
����i��h����K�՚{��揬S�����t�'�����v�m&����:�����C@�߲���Bs����q��a?����         Z  x���MN�0�מS�'Mz��ۖ��% �r��T�'\a�F<;�� e��oތ�.�]��Uz��w��+�H�e���K����ɛt��&]`�O"*&v���O�h��_��)AX����$�Y95{�2M���2�9�`�E�#�O�qL�)TIǖp��F���]n�V��p5�z �Ɠf.$�7�������QƱ��ʜ��Qb��',��.�^U�7�� z�I�h ����� )�f�W��#j��k�6x��t���� �z-k'�p���?v�s�c�SG$�e� ۉ�%���V����mW�+��|��\˃����{�W��	}M��      �   �  x�}Sˎ�F]��c����.����R�@ۼ�``u�(�&�(�F�2��*#��G�����g��HQ"���n8��T5�+X ����AX����$�w������$N��%��HhXG��!�r����䕊?���j��1�����͢E����mH��z�{'�J����K5�d�^2��V�U�9?�wGg&8��
�{衤��������4����,�C&{�Lq�U�$̋��O���e�l:֪29��k5���ܿ�@]xX��u]��]��P�q!u�3�8h煆�gF��G��)���|"�3AoÞD]ч��P�*�C��;/Q+T��A�� ��RF���zo���Y�s�%GJ�W#�T��l>��@�s�{�G���[l?4����{���@�c�yh>6���C�=�O|�����d,ۿ��I���t׆z�Q���+Վ�eN�H��cjHш�s��R���6���m��{��ݘp"Ibm��%^2�I��3��ِ:<�"X���bȯ��T��<�����-##J�*h��/�\e�9���*�7�jWdԙ�}�$A�V��[��_���?`�������;,�������N81[���DS�Zu�n�g݋�l,#ڡ��ʎʋ�����Z ��(H�� ��ɇ�G�ߢ(����xw)h~Ñ|x��
������͍?Ql���@��ٺ�=��� �n�Q�j�H��0�ɒ�0�쥵q��<9������?ܻ�?��F�.m�H9,��n�c��������/!tGӝ%2�Yd��7q��e\��1�}&�j���ݑ���� �	c��<Z!�=˺*A:Jr'j�v
m̀[�E�A��S������E�����r<\K���K�\l�:�5�ۺ�$�󹬒���������bS��3����{���0�zC�Z� [      �   5  x��V�n�V]S_Ax�+���n�m��@�ǥ�Z��j��p��N�Y����%+K����ԙ!m+���
�$^^Μ9��\�".�e^��uy)�U9��\�B.�y�b*Y�O�Ҵ8鈴;YjE����#?�T3]�{7������ϒ��'4�A�1sZ���V�3ϲ8�uCX�������Ɍ�w��"?���5�OU� ��<���r.��*�=.��<���=�T��ͧ���oe�B�Y9��\�u+T;y�6/�U����>9V�a*��茞[�V�>U�/B���.�B��V0;�&�o13����8[����&��@�D՘�w���d��p ީ����R�9��·%<s!�@���|�tbP�.��H-_���(�0:r�-1��Dx7�r�����DH Կ/�V:�����
1�"p�
�x�數��s�BQ�T^�]U�T�5~"��BPO�j��S}������+t��'��^Q9�n��H8�pkG1��I��-%_��.����9U	)��	\�qm�1���KpPWP�7d<�����7x�� ��T��������LE��@�>�;xy��n ��	��B�)��I�1*9G%���"o0?��-(���T�/�a+�C�w�k:.����|O��f�������φ��b����c�����#�{>uZWLl)_�W�/W����	ɼ!���J_����k��|��2/ʳ�w�M �I.�/!�ܾ���ި	*��Nxv�԰�$� �
u���#������h� B�ۺ�k��'$[Ů��:(Ӹ2��]^����2�����	]6U�f%�-i���^����H����nP��rD6t�9ֆ"~�����������!���bA`�L�g8AhY��� �j[/QqA��B��H5�O4.���7$�q�6�apE�I�4�ϛ�b~F-��x-��Q��C���,t��N1?�bh�Ћ�6m?�ڢ�f턥�$z���I��Gy����`p��sV��QCcuT����x"�����ߋΞb5W�����e&c���X �b<q�t�f3lC�P6q�d�3�l9��5;#��܉�v��2�YG0+bݣHt��ݵ-����L-*uaU*��:�Jz�B���"ղ�a7H5_���2�Š�����!;���	|!�/��6c���H͛W]\ԇ+ �B��K��dXn�U{/�F�=E��?�>�W��i��-w��������#:j1�Øy�����i�����5]�0t��-T����\�}�����4�?P��f���n4�(             x�3�v�2�tt�������� ,>�      �   S   x�ʽ	�0@��n��q&F�l����	B2û���{�N[�:��f�j��(�d���K�I8�6��Ϣ�H:w��f1.`     