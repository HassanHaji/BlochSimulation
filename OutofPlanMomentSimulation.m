addpath(genpath('BlochSimulationCode'))
%% 
clear all
figure;
alpha1= [1:50];
clear NSRF10
for jj = 1:length(alpha1)
    T1_all = 1:1:1700;M0 = 1;
    TR=3.15*10;alpha=alpha1(jj)/180*pi;M0=1;
    NSRF10 = M0*(1-exp(-TR./T1_all))./(1-cos(alpha).*exp(-TR./T1_all));
    NSRF10_all(:,jj) = NSRF10;
    
    TR=3.15*7;
    NSRF7 = M0*(1-exp(-TR./T1_all))./(1-cos(alpha).*exp(-TR./T1_all));
    NSRF7_all(:,jj) = NSRF7;

    TR=3.15*4;
    NSRF4 = M0*(1-exp(-TR./T1_all))./(1-cos(alpha).*exp(-TR./T1_all));
    NSRF4_all(:,jj) = NSRF4;
end


figure; imagesc(abs(NSRF10_all),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc(abs(NSRF7_all),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc(abs(NSRF4_all),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc((NSRF10_all-NSRF4_all),[0 .2]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc((NSRF7_all-NSRF4_all),[0 .2]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])



%%
NSRF10_slc2_all_use = squeeze(mean(NSRF10_slc2_all(end-13:end,:,:),1));
NSRF7_slc2_all_use = squeeze(mean(NSRF7_slc2_all(end-13:end,:,:),1));
NSRF4_slc2_all_use = squeeze(mean(NSRF4_slc2_all(end-13:end,:,:),1));

figure; imagesc(abs(NSRF10_slc2_all_use),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc(abs(NSRF7_slc2_all_use),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc(abs(NSRF4_slc2_all_use),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

figure; imagesc(abs(spgr_all),[0 1]); axis square;
set(gca,'fontweight','bold','FontSize',25,'LineWidth',3)
set(gca, 'tickLength',[0;0])

Ipost = find (T1_all == 350);
Ipre = find (T1_all == 1050);
figure; plot(alpha1,squeeze(spgr_all(Ipost,:)./spgr_all(Ipre,:)),'k','LineWidth',5);
hold on; plot(alpha1,squeeze(NSRF10_slc2_all_use(Ipost,:)./NSRF10_slc2_all_use(Ipre,:)),'g','LineWidth',5);
hold on; plot(alpha1,squeeze(NSRF7_slc2_all_use(Ipost,:)./NSRF7_slc2_all_use(Ipre,:)),'b','LineWidth',5);
hold on; plot(alpha1,squeeze(NSRF4_slc2_all_use(Ipost,:)./NSRF4_slc2_all_use(Ipre,:)),'r','LineWidth',5);
lgd = legend('Standard SPGR','NS-RF Every 10 SS-RF','NS-RF Every 7 SS-RF','NS-RF Every 4 SS-RF');
lgd.LineWidth = 3
lgd.FontSize = 20

% lgd.NumColumns = 3;
set(gca,'fontsize',16,'fontweight','bold','FontSize',35,'LineWidth',5); 
xlim([1 50]);ylim([1 3]); set(gca,'LineWidth',5); axis square;
%%
NSRF10_slc2_all_use = squeeze(mean(NSRF10_slc2_all(end-13:end,:,:),1));
NSRF7_slc2_all_use = squeeze(mean(NSRF7_slc2_all(end-13:end,:,:),1));
NSRF4_slc2_all_use = squeeze(mean(NSRF4_slc2_all(end-13:end,:,:),1));

Ipost = find (T1_all == 350);
Ipre = find (T1_all == 1050);
figure; plot(alpha1,squeeze(NSRF10_slc2_all_use(Ipost,:)./NSRF10_slc2_all_use(Ipre,:)-spgr_all(Ipost,:)./spgr_all(Ipre,:)),'g','LineWidth',5);
hold on; plot(alpha1,squeeze(NSRF7_slc2_all_use(Ipost,:)./NSRF7_slc2_all_use(Ipre,:)-spgr_all(Ipost,:)./spgr_all(Ipre,:)),'b','LineWidth',5);
hold on; plot(alpha1,squeeze(NSRF4_slc2_all_use(Ipost,:)./NSRF4_slc2_all_use(Ipre,:)-spgr_all(Ipost,:)./spgr_all(Ipre,:)),'r','LineWidth',5);
lgd = legend('NS-RF Every 10 SS-RF','NS-RF Every 7 SS-RF','NS-RF Every 4 SS-RF');
lgd.LineWidth = 3
lgd.FontSize = 20

% lgd.NumColumns = 3;
set(gca,'fontsize',16,'fontweight','bold','FontSize',35,'LineWidth',5); 
xlim([1 50]);ylim([0 .3]); set(gca,'LineWidth',5); axis square;



%% DIfference 4RF vs SPGR
colorUse{1} = '-k'; Legend{1} = 'Flip Angle=5';
colorUse{2} = '-r';Legend{2} = 'Flip Angle=10';
colorUse{3} = '-b';Legend{3} = 'Flip Angle=15';
colorUse{4} = '-g';Legend{4} = 'Flip Angle=20';
colorUse{5} = '-m';Legend{5} = 'Flip Angle=25';
colorUse{6} = '-.k';Legend{6} = 'Flip Angle=30';
colorUse{7} = '-.r';Legend{7} = 'Flip Angle=35';
colorUse{8} = '-.b';Legend{8} = 'Flip Angle=40';
colorUse{9} = '-.g';Legend{9} = 'Flip Angle=45';
colorUse{10} = '-.m';Legend{10} = 'Flip Angle=50';

figure;
alpha1= [5,10,15,20,25,30,35,40, 45, 50];
Puse_RF10 = squeeze(mean(NSRF10_slc2_all(end-13:end,:,:),1));

for jj = 1:length(alpha1)
    T1_all = 20:1:1700;M0 = 1;
    TR=3.15*3;alpha=alpha1(jj)/180*pi;M0=1;
    spgr_all_diff(:,jj) = spgr_all(:,jj)-Puse_RF10(:,jj);
    plot(T1_all,spgr_all_diff(:,jj),colorUse{jj},'LineWidth',5);hold on;
end
lgd = legend('FA=5','FA=10','FA=15','FA=20',....
    'FA=25','FA=30','FA=35','FA=40','FA=45','FA=50');
lgd.LineWidth = 3
% lgd.NumColumns = 3;
set(gca,'fontsize',16,'fontweight','bold'); 
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 20;; axis square
xlim([20 1500]);ylim([0 0.1]); set(gca,'LineWidth',5); 
ax.LineWidth = 5;

Ipost = find (T1_all == 350);
Ipre = find (T1_all == 1050);
figure; plot(alpha1,squeeze(spgr_all(Ipost,:)./spgr_all(Ipre,:)));
%% Bland Altman plot polling all flip angles 
d2 = spgr_all(:);
d1 = Puse_RF10(:);
diff = d1 - d2;
avg = (d1 + d2)/2;
diff_mean = mean( diff );
diff_SD = std( diff );
upper = diff_mean + 1.96*diff_SD;
lower = diff_mean - 1.96*diff_SD;
AVG = mean( [d1; d2] );
disp( [ 'Average of all (mm) = ' num2str( AVG ) ] );
disp( [ 'Mean Difference (mj) = ' num2str( diff_mean ) ] );
disp( [ '+ and - 1.96SD = ' num2str( upper ) ' and ' num2str( lower ) ] );
disp( [ 'Mean difference from Avg.  = ' num2str( diff_mean/AVG*100 ) ' %' ] );
disp( ' ' )

maxxx = 1;
interval = (0:.1:1)*maxxx;
len = length( interval );
ref = ones( 1, len );
mark = { '.', '+', '.', '^' };
msize = [ 80, 20, 45, 18 ];
m = 0;
figure(2)
plot( avg, diff, mark{1}, 'color', 'k', 'markersize', msize(1), 'linewidth', 5 );
hold on

plot( interval, diff_mean*ref, 'r', 'markersize', 50, 'linewidth', 7 )
hold on
plot( interval, upper*ref, '--b', 'markersize', 50, 'linewidth', 7 )
hold on
plot( interval, lower*ref, '--b', 'markersize', 50, 'linewidth', 7 )
hold on
% title('FLow','FontSize',50)
axis( [0 maxxx -maxxx/6 maxxx/6])
axis square
set(gca,'YTick',round((-1:.5:1)*maxxx/6*100)/100 );
set(gca,'XTick',[0 maxxx] );

set( gca, 'fontsize', 35, 'fontweight', 'bold' )
% xlabel( 'Mean Flow (mL)', 'fontsize', 60, 'fontweight', 'bold' )
% ylabel( 'Difference in Flow (mL)', 'fontsize', 60, 'fontweight', 'bold' )
set( [], 'fontsize', 35, 'fontweight', 'bold', 'box', 'on' ) %, 'orientation', 'horizontal' );
text0 = [ num2str( round(diff_mean*100)/100) ];
text1 = [ num2str( round((upper)*100)/100 ) ];
text2 = [ num2str( round((lower)*100)/100 ) ];

text( 0.5, .0, text0, 'fontsize', 35, 'fontweight', 'bold', 'color', 'k');
text( 0.5, .1, text1, 'fontsize', 35, 'fontweight', 'bold', 'color', 'k' );
text(0.5, -.1, text2, 'fontsize', 35, 'fontweight', 'bold', 'color', 'k');
set(gca,'LineWidth',5 );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

